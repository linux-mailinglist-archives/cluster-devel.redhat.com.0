Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6D9602B5018
	for <lists+cluster-devel@lfdr.de>; Mon, 16 Nov 2020 19:46:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605552388;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=zLuH+/sYJouzNNi6dexlscgUtoj+kntSv1D4OKu47Yo=;
	b=Q43AeLUrX30FJCmArluVkQblV6I6dzRJZiN3OdiYSj/CWSF/iLL4B5tYkYx5jSfJbOaQo9
	N/P/exMlOOztjqK2N8UjmaUKQYN1CcQ8hUe4/7wQjUpHPkyTtrvjmyPelVgZnIWBLnlHg6
	buJz/+fSYAhIGjPSt+o95V/AhlT/5Ds=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-_f_TbdVVOuiSAEU2hpS-9w-1; Mon, 16 Nov 2020 13:46:26 -0500
X-MC-Unique: _f_TbdVVOuiSAEU2hpS-9w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04C4787951D;
	Mon, 16 Nov 2020 18:46:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 08AEF60C04;
	Mon, 16 Nov 2020 18:46:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A7356183D021;
	Mon, 16 Nov 2020 18:46:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AGIkFT9013763 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 16 Nov 2020 13:46:16 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BDFE13322A; Mon, 16 Nov 2020 18:46:15 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B86276FA7F
	for <cluster-devel@redhat.com>; Mon, 16 Nov 2020 18:46:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 244B890E42E
	for <cluster-devel@redhat.com>; Mon, 16 Nov 2020 18:46:11 +0000 (UTC)
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
	[209.85.166.198]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-148-OExtVVdKMkCw9MEhHqTnWw-1; Mon, 16 Nov 2020 13:46:08 -0500
X-MC-Unique: OExtVVdKMkCw9MEhHqTnWw-1
Received: by mail-il1-f198.google.com with SMTP id g125so1347375ilh.6
	for <cluster-devel@redhat.com>; Mon, 16 Nov 2020 10:46:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zLuH+/sYJouzNNi6dexlscgUtoj+kntSv1D4OKu47Yo=;
	b=DNCHNJxFGK0zSna0j+PZb1xJJuepHu746JafC0TN9NhA3EhDfcrzPwKdHrilltEjf/
	gWg+0cwIek6IcaRZgv7qtJuCz2SN08yZ595gmQaSYZjNp/Z+OsrOpB9Aeu48lZXveLQ0
	m280igtpO1a1UyME/6YxyIX27m39VlEw46mSKAWgHef6oSBGNk65sjSmb9+5fjdqsDyt
	AkMmQnm+C/6fbkuhp9iWBgTUQSOmQrMfmaNqdeff4GIIAqqkPjpjyLRSk65bDnuPWZSq
	gmwkWZmve/pCbJAVjBy08EesDaXwXZ85P1loFnqUPf8iciF9bT8aYCp4xQ0FoSJUxutl
	3xkQ==
X-Gm-Message-State: AOAM530jrFavicgR/5HbUKy1o9EGhiwBLHLyzMNh9E7uG8aUY8R819uy
	JHObgpG7T6F0tuhIgzIbNohqetPro4GH1BKrKvlJ0gWXGLzbyUhcHD7YtB4bEKz7fDS+h2jodyD
	ARSZqTea0qccNfLVeg3MWzz+Jxztcd3Mk8Yatlg==
X-Received: by 2002:a92:c08b:: with SMTP id h11mr4252039ile.231.1605552367297; 
	Mon, 16 Nov 2020 10:46:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyHtxKMUoh7HpPz9b/a13Xr6QNsyE0PV1hCiWXimTQUP6gQ997h0a8Zhclp4ZxAHZCOtckkOM2kDnfzQgwIsVU=
X-Received: by 2002:a92:c08b:: with SMTP id h11mr4252026ile.231.1605552367033; 
	Mon, 16 Nov 2020 10:46:07 -0800 (PST)
MIME-Version: 1.0
References: <20201113225814.461167-1-aahringo@redhat.com>
	<20201113225814.461167-16-aahringo@redhat.com>
In-Reply-To: <20201113225814.461167-16-aahringo@redhat.com>
From: Alexander Ahring Oder Aring <aahringo@redhat.com>
Date: Mon, 16 Nov 2020 13:45:56 -0500
Message-ID: <CAK-6q+hGxbWOQ0W4wjvETCOCH6Xp25wTnop9COF3FOk8tv=Q5Q@mail.gmail.com>
To: David Teigland <teigland@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [RFC PATCH dlm/next 15/16] fs: dlm: add
 reliable connection if reconnect
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Fri, Nov 13, 2020 at 5:58 PM Alexander Aring <aahringo@redhat.com> wrote:
>
> This patch introduce to make a tcp lowcomms connection reliable even if
> reconnects occurs. This is done by an application layer retransmission
> handling and sequence numbers in dlm protocols. There are three new dlm
> commands:
>
> DLM_OPTS:
>
> This will encapsulate an exisiting dlm message (and rcom message if they
> don't have an own application side retransmission handling). As optional
> handling additional tlv's (type length fields) can be appended. This can
> be for example a sequence number field. However because in DLM_OPTS the
> lockspace field is unused and a sequence number is a mandatory field it
> isn't made as a tlv and we put the sequence number inside the lockspace
> id. The possibilty to add optional options are still there for future
> purposes.
>
> DLM_ACK:
>
> Just a dlm header to ackknowledge the receipe of a DLM_OPTS message to
> it's sender.
>
> DLM_FIN:
>
> A new DLM message to synchronize pending message to the other dlm end if
> the node want to disconnects. Each side waits until it receives this
> message and disconnects. It's important that this message has nothing to
> do with the application logik because it might run in a timeout if

s/logik/logic/

> ackknowledge messages are dropped.
>
> To explain the basic functionality take a look into the
> dlm_midcomms_receive_buffer() function. This function will take care
> that dlm messages are delivered according to their sequence numbers and
> request retransmission via sending ackknowledge messages. However there
> exists three cases:
>
> 1. sequence number is the one which is expected. That means everything
>    is working fine. Additional there is always a check if the next
>    message was already queued for future, this will occur when there was
>    some messages drops before.
>
> 2. A sequence number is in the future, in this case we queue it for might
>    future delivery, see case 1.
>
> 3. A sequence number is in the past, in this case we drop this message
>    because it was already delivered.
>
> To send ackknowledge we always send the sequence number which is
> expected, if the other node sends multiple ackknowledge for the same

s/sends/receives/

> sequence numbers it will trigger a retransmission. In case no ackknowledge
> is send back, a timer with a timeout handling is running and will trigger
> a retranmission as well. Sending multiple acks with the same sequence or
> messages with the same sequence should not have any effects that breaks
> dlm. Only messages in the far future can break dlm, that's why important
> that the closing connection is right synchronized with DLM_FIN which
> also resets the sequence numbers.

s/ackknowledge/acknowledge/ everywhere and s/retranmission/retransmission/

sorry, I will run aspell on my commit message (I thought checkpatch is
doing that).

>
...
> +
> +               dlm_receive_buffer(p, nodeid);
> +               return;
> +       case DLM_OPTS:
> +               seq = le32_to_cpu(p->header.u.h_seq);
> +
> +               ret = dlm_opts_check_msglen(p, msglen, nodeid);
> +               if (ret < 0)
> +                       return;
> +#if 0
> +               ret = dlm_parse_opts(p->opts.o_opts, p->opts.o_optlen);

le16_to_cpu() is missing in optlen.

> +               if (ret < 0)
> +                       return;
> +#endif
> +
> +               p = (union dlm_packet *)((unsigned char *)p->opts.o_opts + ret);
> +

mhh, this + ret is a leftover of the commented code above. I commented
it in because as so far we don't have any opts, we simply ignore it,
we still can make changes to the tlv header e.g. I wasn't sure about
one byte or 2 byte fields. 2 bytes is fine or we have a lot of pads
which we may never use? We have then a lot of space in types and
lengths, but we probably never have a length above 255 for full
messages less than 4096, also 255 for types is okay as well, may the
4096 bytes limit can be changed in future...

- Alex

