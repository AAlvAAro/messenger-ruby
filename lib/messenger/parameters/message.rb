module Messenger
  module Parameters
    class Message
      include Callback

      attr_accessor :mid, :seq, :text, :attachments

      def initialize(mid:, seq:, text: nil, attachments: nil)
        @mid         = mid
        @seq         = seq
        @text        = text if text.present?
        @attachments = build_attachments(attachments) if attachments.present?
      end

      def build_attachments(attachments)
        attachments.map { |attachment| Attachment.new(attachment.symbolize_keys.slice(:type, :payload)) }
      end
    end
  end
end
