using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace calc
{
    public class Calculate
    {
       public delegate double Functor(double firstArg,double SeconArg);
        Dictionary<string,Functor> funcsCalc  = new Dictionary<string,Functor>()
        {
            {"+",(firstArg,SecondArg)=> firstArg+SecondArg},
            {"-",(firstArg,SecondArg)=>firstArg-SecondArg},
            {"*",(firstArg,SecondArg)=>firstArg*SecondArg},
            {"/",(firstArg,SecondArg)=>firstArg/SecondArg}
        };
        Stack<string> fns = new Stack<string>();

        double solution =111;
        public double Solution
        {
            get {return solution; }
            set { ;}
        }
        Functor lastoperation;
        


        public Calculate(string expression)
        {
            string[] expression_without_brackets= expression.Split('(',')');
            solution = recursion(expression_without_brackets);
         
            
            
        }
        double recursion(string[] expressions)
        {   
            double numb;
            int d;
            
            if (Int32.TryParse(expressions[0], out d)&&(expressions.Length==1))
                return int.Parse(expressions[0]);
            else if (double.TryParse(expressions[0], out numb) && (expressions.Length == 1))
                    return double.Parse(expressions[0]);
            else if (double.TryParse(expressions[0], out numb) && (expressions.Length >1))
            {
                string[] realexprsec = new string[expressions.Length - 1];
                for (int i = 1; i < expressions.Length; i++)
                {
                    realexprsec[i - 1] = expressions[i];
                }
                return lastoperation(int.Parse(expressions[0]),recursion(realexprsec));
            }
             
            else 
            {
                foreach (KeyValuePair<string, Functor> func in funcsCalc)
                {
                    if (expressions[0].Contains(func.Key))
                    {

                        string[] expr = expressions[0].Split(Convert.ToChar(func.Key));
                        double number;
                        
                       
                        List<string> exprsec=new List<string>();
                        
                        
                        exprsec.AddRange(expr.Where((value,index)=>index>0&&value!=""));
                         string[] realexprsec = new string[exprsec.Count+expressions.Length-1];
                         realexprsec = exprsec.ToArray();
                        
                        if (expressions.Length > 1)
                        {
                            exprsec.AddRange(expressions.Where((value,index)=>index>0&&value!=""));
                            realexprsec=exprsec.ToArray();
                        }
                        
                           
                            if (double.TryParse(expr[0], out number))
                            {
                                lastoperation = funcsCalc[func.Key];
                              return  funcsCalc[func.Key](int.Parse(expr[0]), recursion(realexprsec));

                            }
                            else 
                            {
                                string[] exprfirst = new string[] { expr[0] };
                              return  funcsCalc[func.Key](recursion(exprfirst), recursion(realexprsec));
                            }
                    
                    }
                   
                }
                return 0;
            }
            
        }
        public void AddFunc(string type,Functor func)
        {
            funcsCalc.Add(type,func);
        }
        
    }
}