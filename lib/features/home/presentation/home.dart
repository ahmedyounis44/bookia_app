import 'package:bookia_application/features/home/cubit/cubit/home_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Scaffold(
        body: Center(
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  IconButton(onPressed: (){
                    if (context.locale.languageCode == 'en') {
                      context.setLocale(Locale('ar'));
                    } else {
                      context.setLocale(Locale('en'));
                    }
                  } , icon: Icon(Icons.language),iconSize: 50,),
                  SizedBox(height: 30),
                  Text("login".tr(), style: TextStyle(fontSize: 50)),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 20,
                  children: [
                    IconButton(onPressed: () => HomeCubit.get(context).increment(), icon: Icon(Icons.add),iconSize: 50,),
                    Text(HomeCubit.get(context).counter.toString(), style: TextStyle(fontSize: 50),),
                    IconButton(onPressed: () => HomeCubit.get(context).decrement(), icon: Icon(Icons.remove),iconSize: 50,),
                  ],
                ),
                ] 
              );
            },
          ),
        ),
      ),
    );
  }
}
