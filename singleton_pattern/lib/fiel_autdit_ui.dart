import 'package:flutter/material.dart';

import 'file_audit_manager.dart';

class FileAuditUi extends StatefulWidget {
  const FileAuditUi({super.key});

  @override
  State<FileAuditUi> createState() => _FileAuditUiState();
}

class _FileAuditUiState extends State<FileAuditUi> {
  final filedAuditManager = FileAuditManager();
  @override
  void dispose() {
    // TODO: implement dispose
    FileAuditManager().closLogFile();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          TextButton(
                onPressed: () {
                  filedAuditManager.logAction("message");
                },
                child: Text("press me"))
        ],
      ),
    );
  }
}