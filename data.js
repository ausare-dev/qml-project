const data = [
               { microphone: "1", type: "Hyper X Quadcast S", status: "Работает нормально", datetime: "30.03.2024 04:37:46", probability: "0.02%", lastUpdate: "25.03.2024 18:23:10", analysisDevice: "Регулятор №1", failureStatus: "Исправлено" },
               { microphone: "2", type: "Hyper X Quadcast S", status: "Вероятен сбой", datetime: "30.03.2024 04:37:46", probability: "46%", lastUpdate: "25.03.2024 18:23:10", analysisDevice: "Вентилятор №1", failureStatus: "Текущий" },
               { microphone: "3", type: "Hyper X Quadcast S", status: "Микрофон не подключен", datetime: "30.03.2024 04:37:46", probability: "0%", lastUpdate: "25.03.2024 18:23:10", analysisDevice: "Нанос №1", failureStatus: "Исправлено" },
               { microphone: "4", type: "Hyper X Quadcast S", status: "Сбой", datetime: "30.03.2024 04:37:46", probability: "94%", lastUpdate: "25.03.2024 18:23:10", analysisDevice: "Регулятор №1", failureStatus: "Текущий" },
               { microphone: "5", type: "Hyper X Quadcast S", status: "Работает нормально", datetime: "30.03.2024 04:37:46", probability: "0.01%", lastUpdate: "25.03.2024 18:23:10", analysisDevice: "Нанос №2", failureStatus: "Исправлено" },
               { microphone: "6", type: "Hyper X Quadcast S", status: "Вероятен сбой", datetime: "30.03.2024 04:37:46", probability: "50%", lastUpdate: "25.03.2024 18:23:10", analysisDevice: "Вентилятор №2", failureStatus: "Текущий" },
               { microphone: "7", type: "Hyper X Quadcast S", status: "Сбой", datetime: "30.03.2024 04:37:46", probability: "85%", lastUpdate: "25.03.2024 18:23:10", analysisDevice: "Регулятор №2", failureStatus: "Текущий" },

           ];
function getMicrophoneData() {
    return data
}

function getLength(){
    return data.length
}
