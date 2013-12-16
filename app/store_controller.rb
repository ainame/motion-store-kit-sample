# -*- coding: utf-8 -*-
class StoreController < UIViewController
  extend IB
  outlet :item_label
  outlet :buy_button

  def viewDidLoad
    super
  end

  def buy
    alert = UIAlertView.new.tap do |a|
      a.title   = '購入の確認'
      a.message = 'こちらの何だかよくわからないものを買いますか？'
      a.tag = 1
      a.delegate = self
      a.addButtonWithTitle("Cancel")
      a.addButtonWithTitle("OK")
    end
    alert.show
  end

  BUTTON_OK = 1
  def alertView(alert_view, clickedButtonAtIndex: button_index)
    if button_index == BUTTON_OK
      purchase_process
    end
  end

  def purchase_process
    helu         = Helu.new('item01')
    helu.fail    = on_fail
    helu.winning = on_win
    helu.buy
    helu.close
  end

  def on_win
    lambda do |transaction|
      show_alert "買った!!買ったよ!!"
    end
  end

  def on_fail
    lambda do |transaction|
      show_alert "買えなかったよorz..."
    end
  end

  def show_alert message
    UIAlertView.new.tap do |a|
      a.message = message
      a.addButtonWithTitle("OK")
    end.show
  end
end
