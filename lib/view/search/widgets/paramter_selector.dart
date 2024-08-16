import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m2p_assignment/res/AppContextExtension.dart';
import 'package:m2p_assignment/view/media_selection/media_selection_screen.dart';

import '../../../view_model/media_selection_view_model.dart';

class ParameterSelector extends ConsumerWidget {
  const ParameterSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaModel = ref.watch(mediaViewModelProvider);
 return InkWell(
  onTap: ()=>Navigator.of(context).pushNamed(MediaSelectionScreen.id),
   child: Container(
        width: double.maxFinite,
        height: context.resources.screenHeight * 0.15,
        color: context.resources.color.backgroundColor,
        child: Wrap(
          spacing: 8.0,
          children: mediaModel.map((parameter) {
            return ChoiceChip(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(
                      context.resources.dimension.chipsBorderRadius))),
              selected: false,
              color: WidgetStatePropertyAll(context.resources.color.chipsColor),
              label: Text(parameter,style: TextStyle(color: context.resources.color.secondaryColor), ),
              onSelected: (selected) {
                
              },
            );
          }).toList(),
        ),
      ),
 );
  
  }
}

