import 'dart:io';

class FileAuditManager {
  //static instance
  static final FileAuditManager _intance = FileAuditManager._internal();
  //private constructor
  FileAuditManager._internal() {
    _openLogFile();
  }
  //factory constructor
  factory FileAuditManager() {
    return _intance;
  }

  late File _logFile;
  late IOSink _fileSink;
  void _openLogFile() {
    _logFile = File("autit_log.txt");
    _fileSink = _logFile.openWrite(mode: FileMode.append);
  }

  void logAction(String message) {
    final timestemp = DateTime.now().toIso8601String();
    final logEntry = "$timestemp:$message";
    _fileSink.write(logEntry);
  }

  Future<void> closLogFile() async {
    await _fileSink.flush();
    await _fileSink.close();
  }
}
