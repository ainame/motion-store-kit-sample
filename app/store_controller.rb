# -*- coding: utf-8 -*-
class StoreController < UIViewController
  extend IB
  outlet :item_label
  outlet :buy_button

  def viewDidLoad
    super
    p 'start'
    p item_label
    Helu::ProductInfoFetcher.fetch(['item01']) do |item|
      p item
      item_label.text = item
      p 'end'
    end
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

end
