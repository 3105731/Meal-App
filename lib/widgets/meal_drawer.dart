import 'package:flutter/material.dart';

class MealDrawer extends StatelessWidget {
  const MealDrawer({super.key, required this.onSelectScreen});

  final void Function (String identifier) onSelectScreen;


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Drawer(child: Column(
      children: [
     DrawerHeader(
         padding:const EdgeInsets.all(20) ,
       decoration: BoxDecoration(
         gradient: LinearGradient(colors: [
           Theme.of(context).colorScheme.primaryContainer,
           Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8),
         ],) ,
       ),
       child: Row(children: [
         Icon(
           size: 48,
           Icons.fastfood,
           color:Theme.of(context).colorScheme.primary ,),
         const SizedBox(width: 18,),
         Text("Cooking Up",style: Theme.of(context).textTheme.titleLarge!.copyWith(
           color: Theme.of(context).colorScheme.primary,
         ),),

       ],),
     ),

        ListTile(
          onTap: (){
            onSelectScreen('meals');
          },
          leading:Icon(
        Icons.restaurant_outlined,
         color:Theme.of(context).colorScheme.onBackground ,),

          title:Text("Meals",style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),),
        ),
        ListTile(
          onTap: (){
            onSelectScreen('filters');
          },
          leading:Icon(
            Icons.settings,
            color:Theme.of(context).colorScheme.onBackground ,),

          title:Text("Filters",style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),),
        ),

      ],
    ),);
  }
}