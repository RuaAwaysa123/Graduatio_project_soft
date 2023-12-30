import 'package:flutter/material.dart';
import '../../../model/User1.dart';


class AddCertificateDialog extends StatefulWidget {
  final Function(Certificate) onCertificateAdded;

  const AddCertificateDialog({Key? key, required this.onCertificateAdded}) : super(key: key);

  @override
  _AddCertificateDialogState createState() => _AddCertificateDialogState();
}

class _AddCertificateDialogState extends State<AddCertificateDialog> {
  TextEditingController certificateNameController = TextEditingController();
  TextEditingController issueOrganizationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Certificate'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: certificateNameController,
            decoration: InputDecoration(labelText: 'Certificate Name'),
          ),
          TextField(
            controller: issueOrganizationController,
            decoration: InputDecoration(labelText: 'Issue Organization'),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            Certificate newCertificate = Certificate(
              certificateName: certificateNameController.text,
              issueOrganization: issueOrganizationController.text,
              certificateURL: '',  // Update with the correct field or remove if not needed
              id: '',
            );

            widget.onCertificateAdded(newCertificate);

            Navigator.of(context).pop();
          },
          child: Text('Add Certificate'),
        ),
      ],
    );
  }
}
