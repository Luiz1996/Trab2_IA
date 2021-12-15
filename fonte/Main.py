import numpy as np

from DataBase import DataBase
from Notice import Notice
from Quotation import Quotation
from textblob import TextBlob


def printNoticeAndQuotationAndNormalizedVetors(notices, quotations, polarities, normalizedPrice):
    print("************************************************** IMPRESSÃO DOS DADOS *************************************************")
    for i in range(len(quotations)):
        print(quotations[i].date)
        for j in range(len(notices)):
            if quotations[i].date == notices[j].date:
                print("Menssagem:", notices[j].title_modified)

        print("Preço:", quotations[i].price)
        print("Variação:", quotations[i].variation)

        if quotations[i].variation > 0:
            print("Status: Houve ganho")
        elif quotations[i].variation < 0:
            print("Status: Houve perda")

        print("-----------------------------------------")

    print("\n****************************** VETOR DE SENTIMENTOS/POLARIDADES NORMALIZADAS ENTRE -1 E 1 ******************************")
    for i in range(len(polarities)):
        print("{:.5f}".format(polarities[i]), end=" ,")


def getNoticesData(notices, polarities):
    # Query para obter dados sobre as notícias
    sql = "SELECT id, DATE_FORMAT(date,'%d/%m/%Y') as date, title, title_modified, url_notice from notice"

    # Executando a query e setando os valores no arrayNotices
    connection = DataBase().getConnection()
    cursor = connection.cursor()
    cursor.execute(sql)
    arrayNotices = cursor.fetchall()

    # Criando vetor/lista de Notice.py
    for i in range(len(arrayNotices)):
        notice = Notice(arrayNotices[i][0], arrayNotices[i][1], arrayNotices[i][2], arrayNotices[i][3],
                        arrayNotices[i][4])
        notices.append(notice)

    # Realizando a tradução da notícia de português -> inglês e em seguida obtendo a polaridade entre -1 e 1
    for notice in notices:
        blob = TextBlob(''.join(notice.title_modified))
        translatedMessage = blob.translate(to='en')
        testimonial = TextBlob(str(translatedMessage))
        polarities.append(testimonial.sentiment.polarity)


def getQuotationData(quotations, variationPrices):
    # Query para obter dados sobre as cotações
    sql = "SELECT id, DATE_FORMAT(date,'%d/%m/%Y') as date, price, variation from quotation"

    # Executando a query e setando os valores no arrayQuotation
    connection = DataBase().getConnection()
    cursor = connection.cursor()
    cursor.execute(sql)
    arrayQuotation = cursor.fetchall()

    # Criando vetor/lista de Quotation.py
    for i in range(len(arrayQuotation)):
        quotation = Quotation(arrayQuotation[i][0], arrayQuotation[i][1], arrayQuotation[i][2], arrayQuotation[i][3])
        quotations.append(quotation)

    # Obtendo preços/cotações
    for quotation in quotations:
        variationPrices.append(float(quotation.price))

    # Convertendo os preços/cotações em Array de Preços/Cotações
    npVariation = np.array(variationPrices)

    # Retornando preços normalizados entre -1 e 1
    return (2 * (npVariation - np.min(npVariation)) / np.ptp(npVariation) - 1)


def getRangeNormalizedPrice(normalizedPrice, initialPosition, lenghtNotice):
    newNormalizedPrice = []

    for i in range(2 + initialPosition, (lenghtNotice + 2 + initialPosition)):
        newNormalizedPrice.append(normalizedPrice[i])

    return newNormalizedPrice


def getAllRangeNormalizedPrice(allRangesNormalizedPrice, normalizedPrice, lenght):
    allRangesNormalizedPrice.append(getRangeNormalizedPrice(normalizedPrice, -2, lenght))
    allRangesNormalizedPrice.append(getRangeNormalizedPrice(normalizedPrice, -1, lenght))
    allRangesNormalizedPrice.append(getRangeNormalizedPrice(normalizedPrice, 0, lenght))
    allRangesNormalizedPrice.append(getRangeNormalizedPrice(normalizedPrice, 1, lenght))
    allRangesNormalizedPrice.append(getRangeNormalizedPrice(normalizedPrice, 2, lenght))


def getTypeCorrelation(value):
    realValue = value

    if value < 0:
        value *= -1

    if 0 <= value <= 0.19:
        return "{:.5f}".format(realValue) , " -> Correlação bem fraca."
    elif 0.20 <= value <= 0.39:
        return "{:.5f}".format(realValue) , " -> Correlação fraca."
    elif 0.40 <= value <= 0.69:
        return "{:.5f}".format(realValue) , " -> Correlação moderada."
    elif 0.70 <= value <= 0.89:
        return "{:.5f}".format(realValue) , " -> Correlação forte."
    elif 0.90 <= value <= 1:
        return "{:.5f}".format(realValue) , " -> Correlação muito forte."

def correlations(allRangesNormalizedPrice, polarity):
    print("\n\n***************************** CORRELAÇÕES DE SENTIMENTOS E PREÇOS NORMALIZAD0S ENTRE -1 E 1 ****************************")
    print("Correlação entre Sentimento x Preços de 2 dias atrás...: ", getTypeCorrelation(np.corrcoef(np.array(allRangesNormalizedPrice[0]), polarity)[0][1]))
    print("Correlação entre Sentimento x Preços de 1 dia atrás....: ", getTypeCorrelation(np.corrcoef(np.array(allRangesNormalizedPrice[1]), polarity)[0][1]))
    print("Correlação entre Sentimento x Preços do dia atual......: ", getTypeCorrelation(np.corrcoef(np.array(allRangesNormalizedPrice[2]), polarity)[0][1]))
    print("Correlação entre Sentimento x Preços de 1 dia à frente.: ", getTypeCorrelation(np.corrcoef(np.array(allRangesNormalizedPrice[3]), polarity)[0][1]))
    print("Correlação entre Sentimento x Preços de 2 dias à frente: ", getTypeCorrelation(np.corrcoef(np.array(allRangesNormalizedPrice[4]), polarity)[0][1]))

def printallRangesNormalizedPrice(allRangesNormalizedPrice):
    print("\n\n************************************** VETORES DE PREÇOS NORMALIZAD0S ENTRE -1 E 1 *************************************")
    print("Preços Normalizados de 2 dias atrás...: ", np.round(allRangesNormalizedPrice[0],5))
    print("\nPreços Normalizados de 1 dia atrás....: ", np.round(allRangesNormalizedPrice[1],5))
    print("\nPreços Normalizados do dia atual......: ", np.round(allRangesNormalizedPrice[2],5))
    print("\nPreços Normalizados de 1 dia à frente.: ", np.round(allRangesNormalizedPrice[3],5))
    print("\nPreços Normalizados de 2 dias à frente: ", np.round(allRangesNormalizedPrice[4],5))

if '__main__':
    # Vetores Auxiliares
    notices = []
    quotations = []
    polarities = []
    variationPrices = []
    normalizedPrice = []
    allRangesNormalizedPrice = []

    # Realizando consulta na base, obtendo notícia e gerando polaridades normalizadas entre -1 e 1
    getNoticesData(notices, polarities)

    # Realizando consulta na base, obtendo cotações e gerando preços normalizados entre -1 e 1
    normalizedPrice = getQuotationData(quotations, variationPrices)

    # Imprimindo todos os dados
    printNoticeAndQuotationAndNormalizedVetors(notices, quotations, polarities, normalizedPrice)

    # Obtendo todos os intervalos de normalização de preços em -2 dias, -1 dia, dia atual, 1 dia a frente e 2 dias a frente
    getAllRangeNormalizedPrice(allRangesNormalizedPrice, normalizedPrice, len(notices))

    # Printa o array de preços normalizados.
    printallRangesNormalizedPrice(allRangesNormalizedPrice)

    # Obtendo os valores de correlações por dia
    correlations(allRangesNormalizedPrice, np.array(polarities))

