module TasksHelper

  # 削除ボタン押下時のメッセージを取得するメソッド
  def deleteConfirm(taskName)
    return '「' + taskName + '」を削除します。よろしいですか？'
  end

  # 文字列がURLであるかを判定するメソッド
  def isUrl?(string)
    # TODO 今考えられるURLの種類を羅列
    urlArray = ["http", "https", "file"]
    urlArray.each do |url|
      return string.start_with?(url)
    end
    return false
  end

end