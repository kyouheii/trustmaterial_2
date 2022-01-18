module UsersHelper

  # 勤怠基本情報を指定のフォーマットで返します。  
  
  def format_basic_info(time)
    format("%.2f", ((time.hour * 60) + time.min) / 60.0)
  end
  
  def format_hour
   format("%.2d", (time.hour * 60))
  end
#時間を１５分区切る
  def format_mini(time)
    format("%.2d", (((time.min) / 15) * 15))
  end
  
  # def working_times(start, finish, tomorrow)
  #   if tomorrow == true
  #     format("%.2f", ((finish.hour - start.hour) + ((finish.min - start.min)  / 60.0) + 24))
  #   else
  #     format("%.2f", ((finish.hour - start.hour) + ((finish.min - start.min)  / 60.0)))
  #   end  
  # end 
  
  # def overtime_hour(finish_plan, finish, tomorrow)
  #   if tomorrow == true
  #     format("%.2f", ((finish_plan.hour - finish.hour) + ((finish_plan.min - finish.min)  / 60.0) + 24))
  #   else
  #     format("%.2f", ((finish_plan.hour - finish.hour) + ((finish_plan.min - finish.min)  / 60.0)))
  #   end  
  # end

end