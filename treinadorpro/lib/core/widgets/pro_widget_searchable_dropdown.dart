import 'package:flutter/material.dart';
import 'package:treinadorpro/core/data/models/iname.dart';

class ProWidgetSearchableDropdown<T extends IName> extends StatefulWidget {
  final List<T> items;
  final String hintText;
  final Function(T?)? onChanged;

  const ProWidgetSearchableDropdown({
    super.key,
    required this.items,
    this.hintText = 'Pesquisar...',
    this.onChanged,
  });

  @override
  State<ProWidgetSearchableDropdown<T>> createState() => _ProWidgetSearchableDropdownState();
}

class _ProWidgetSearchableDropdownState<T extends IName>  extends State<ProWidgetSearchableDropdown<T>> {

  final TextEditingController _textEditingController = TextEditingController();

  List<T> _filteredItems = [];
  T? _selectedItem;

  @override
  void initState() {
    super.initState();
    _filteredItems = List.from(widget.items);
    _filteredItems.sort((a, b) => a.getName().compareTo(b.getName()));
    _textEditingController.addListener(_onSearchChanged);
  }

  @override
  void dispose(){
    _textEditingController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      if (_textEditingController.text.isEmpty) {
        _filteredItems = List.from(widget.items);
      } else {
        _filteredItems = widget.items
            .where((item) => item.getName()
            .toLowerCase()
            .contains(_textEditingController.text.toLowerCase()))
            .toList();
      }
      _filteredItems.sort((a, b) => a.getName().compareTo(b.getName()));
    });
  }

  void _clearTextInput(){
    _textEditingController.clear();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  border: const OutlineInputBorder(),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.backspace),
              onPressed: _clearTextInput,
            ),
          ],
        ),
        const SizedBox(height: 10),
        DropdownButton<T>(
          isExpanded: true,
          value: _selectedItem,
          hint: const Text('Selecione um item'),
          onChanged: (T? newValue) {
            setState(() {
              _selectedItem = newValue;
              if (widget.onChanged != null) {
                widget.onChanged!(newValue);
              }
            });
          },
          items: _filteredItems.map<DropdownMenuItem<T>>((T item) {
            return DropdownMenuItem<T>(
              value: item,
              child: Text(item.getName()),
            );
          }).toList(),
        ),
      ],
    );
  }
}
