var StatusEnum = {
    Running: 0,
    Stopped: 1,
    Error: 2
};
function getStatusText(status) {
    switch (status) {
        case StatusEnum.Running:
            return "Запущена";
        case StatusEnum.Stopped:
            return "Остановлена";
        case StatusEnum.Error:
            return "Ошибка";
        default:
            return "Неизвестный статус";
    }
}
