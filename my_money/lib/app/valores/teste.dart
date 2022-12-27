///dIALOGO D EAVISO 
///
 /*void _showdialog(BuildContext context) async {
   return showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          alignment: Alignment.center,
          backgroundColor: const Color(0xFF5F5DA6),
          title: const Text('Muito Importante'),
          content: const Text("Todas as Informações estão corretas?"),
          icon: const Icon(
            Icons.warning_amber_rounded,
            size: 30,
          ),
          actions: [
            MaterialButton(
              onPressed: () => {
                UserDatePreference().saveUserDate(
                    _nameInputController.text, _patInputController.text),
                Navigator.push(context,
                    CupertinoPageRoute(builder: ((context) => const MyPage())))
              },
              child: const Text('Sim!'),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pop(context, 'Cancel');
              },
              child: const Text('Ops, Vou Ajustar!'),
            )
          ],
        );
      },
    );
  }8*/