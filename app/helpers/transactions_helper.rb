module TransactionsHelper
  def toggle_value(id, status)
    remote_function(:url => {:action => :update_transaction_status},
                    :method => :put,
                    :before => "$('spinner-#{id}').show();$('tstatus_button_#{id}').hide();",
                    :complete => "$('spinner-#{id}').hide();$('tstatus_button_#{id}').show();",
                    :with => "this.status + '=' + #{status} + '&id=' + #{id}"
                    )
  end
end
