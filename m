Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6E7EC353493
	for <lists+cluster-devel@lfdr.de>; Sat,  3 Apr 2021 17:42:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617464569;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=WCeQkXIFsgdfI9m0m2utM0gO1m2Yj0pnH4X/WJSZ4V0=;
	b=EvxCebv2e+O+2dgnbAuzZWViGCWOX1jl+NGBT1sfbZXoMO5DfZoyPpa1z/b4ceWi28vT9z
	lj+x+6QOfig1c9X1LnpU6jYWtQFcR2haepu0AKIamppdZacRMemk3hIPOFEvJlQHidLLQD
	zPBFSxySb400Tuw48c5rIZj17hxZnWQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-FWMUmIEINkWtgTMvfOOiCA-1; Sat, 03 Apr 2021 11:42:47 -0400
X-MC-Unique: FWMUmIEINkWtgTMvfOOiCA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C814710059D8;
	Sat,  3 Apr 2021 15:42:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B55E7100760B;
	Sat,  3 Apr 2021 15:42:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5210F1809C83;
	Sat,  3 Apr 2021 15:42:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 132KsEf6004905 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 2 Apr 2021 16:54:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 91D00FDCFC; Fri,  2 Apr 2021 20:54:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8CA5AFDCFD
	for <cluster-devel@redhat.com>; Fri,  2 Apr 2021 20:54:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 45F3B185A7A7
	for <cluster-devel@redhat.com>; Fri,  2 Apr 2021 20:54:12 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
	[209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-266-aBNPuaBUMhSlV8rUA1ox6w-1; Fri, 02 Apr 2021 16:53:56 -0400
X-MC-Unique: aBNPuaBUMhSlV8rUA1ox6w-1
Received: by mail-wm1-f71.google.com with SMTP id o9so1257831wmq.9
	for <cluster-devel@redhat.com>; Fri, 02 Apr 2021 13:53:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=WCeQkXIFsgdfI9m0m2utM0gO1m2Yj0pnH4X/WJSZ4V0=;
	b=kt1WX+C7IhIVsAbaO40jDsDRTC11q436YMFWUNeTIfzBSoxlV6YOzu/Eu0LuJDgY2S
	lz6f1FpmizjO3Clx4jYkbJRTkW3+khZxZOBxRvuuvnIx7jZnTpjWmmn4ZBgQMbnIUJJj
	GqJiTFxPUrV0WklE6rTLrIt1k6wt4JyoK7Vgr74xTdRj4duEGV1AD8Jyg0UlhS2xSlwc
	/J7eyJZJ3UXrC7dH+zARVENNG2CfZNgQzylEHK6MDfzsodudH5uP6umBEJxuqvs/E0eN
	8oL9Y0wFxc9JnKm4Fl6cYrvO5Evfs398e7z4QyjapLf6ddcNvlNr2ixvhMP4120vS25O
	Wihg==
X-Gm-Message-State: AOAM532lN6+HzYTUNYELCzMlJD6Pkipw1F4FlEMP0+1GWdOLf9C/gHoy
	lE/Z2Hcj6KlnLTHtTi+ZJ1YSEpCt4rZqPvR3V2/ZgU+oDbnpSEuuPPjpZ9rNJA2BuF1ibdKGthW
	KFUb0we9V87U4AUXiXYPL8A==
X-Received: by 2002:a05:6000:83:: with SMTP id
	m3mr3431368wrx.321.1617396835753; 
	Fri, 02 Apr 2021 13:53:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxujBg7qWxr8x9qOl2WmadVnsUwib0HllcTQ9bbAGRoccDI9yFfsgX2NbZmE2JKLXAXQeknSw==
X-Received: by 2002:a05:6000:83:: with SMTP id
	m3mr3431355wrx.321.1617396835577; 
	Fri, 02 Apr 2021 13:53:55 -0700 (PDT)
Received: from linux-2.home
	(2a01cb058918ce00dd1a5a4f9908f2d5.ipv6.abo.wanadoo.fr.
	[2a01:cb05:8918:ce00:dd1a:5a4f:9908:f2d5])
	by smtp.gmail.com with ESMTPSA id
	a14sm14821866wrn.5.2021.04.02.13.53.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 02 Apr 2021 13:53:55 -0700 (PDT)
Date: Fri, 2 Apr 2021 22:53:51 +0200
From: Guillaume Nault <gnault@redhat.com>
To: Alexander Aring <aahringo@redhat.com>
Message-ID: <20210402205351.GA24027@linux-2.home>
References: <20210326173337.44231-1-aahringo@redhat.com>
	<20210326173337.44231-8-aahringo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210326173337.44231-8-aahringo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Sat, 03 Apr 2021 11:40:58 -0400
Cc: cluster-devel@redhat.com, pabeni@redhat.com
Subject: Re: [Cluster-devel] [PATCHv3 dlm/next 7/8] fs: dlm: add reliable
 connection if reconnect
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 26, 2021 at 01:33:36PM -0400, Alexander Aring wrote:
> This patch introduce to make a tcp lowcomms connection reliable even if
> reconnects occurs. This is done by an application layer re-transmission
> handling and sequence numbers in dlm protocols. There are three new dlm
> commands:
> 
> DLM_OPTS:
> 
> This will encapsulate an existing dlm message (and rcom message if they
> don't have an own application side re-transmission handling). As optional
> handling additional tlv's (type length fields) can be appended. This can
> be for example a sequence number field. However because in DLM_OPTS the
> lockspace field is unused and a sequence number is a mandatory field it
> isn't made as a tlv and we put the sequence number inside the lockspace
> id. The possibility to add optional options are still there for future
> purposes.
> 
> DLM_ACK:
> 
> Just a dlm header to acknowledge the receive of a DLM_OPTS message to
> it's sender.
> 
> DLM_FIN:
> 
> A new DLM message to synchronize pending message to the other dlm end if
> the node want to disconnects. Each side waits until it receives this
> message and disconnects. It's important that this message has nothing to
> do with the application logic because it might run in a timeout if
> acknowledge messages are dropped. The problem which we try to solve with
> DLM_FIN is that the node membership is handled by corosync and not the
> kernel dlm protocol itself, DLM_FIN tries to synchronize the kernel dlm
> protocol with corosync join/leave membership callbacks.

If I understand correctly, currently, when DLM faces a hard but
temporary connection failure (like receiving a stray TCP RST), it
automatically recreates a new connection. However, the in-flight data
of the previous connection are lost. The problem is that such data loss
can turn the participating nodes into inconsistent states.

Therefore this patch series implements sequence number tracking at the
application level, so that a new connection can retransmit
unacknowledged data from the previous, failed, connection.

Is that an accurate summary or is there anything I've missed?

I feel that this patch goes very far into re-implementing TCP-like
features. For example, why is fast-retransmit even needed? DLM seems to
always uses a transport protocol that guarantees reliable and in order
delivery. Therefore, duplicate DLM acknowledgements can't happen on an
established connection. Even when reconnecting, it'd be the sender's
responsibility to resend the last unackowledged data first. How could
this lead to holes in the DLM sequence numbers on the receiver's side?

It seems to me that the only time DLM might need to retransmit data, is
when recovering from a connection failure. So why can't we just resend
unacknowledged data at reconnection time? That'd probably simplify the
code a lot (no need to maintain a retransmission timeout on TX, no need
to handle sequence numbers that are in the future on RX).

Also, couldn't we set the DLM sequence numbers in
dlm_midcomms_commit_buffer_3_2() rather than using a callback function
in dlm_lowcomms_new_buffer()?

Finally, I wonder if we could avoid adding DLM sequence numbers
entirely. Have you considered using the TCP_REPAIR infrastructure to
retrieve the send queue of the failed socket and resend that data once
the new socket is connected?

Please correct me if the above suggestions don't make sense. I'm not
familiar with DLM so I can very well be missing important points.

Thanks,

> To explain the basic functionality take a look into the
> dlm_midcomms_receive_buffer() function. This function will take care
> that dlm messages are delivered according to their sequence numbers and
> request re-transmission via sending acknowledge messages. However there
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
> To send acknowledge we always send the sequence number which is
> expected, if the other node sends multiple acknowledge for the same
> sequence numbers it will trigger a re-transmission. In case no acknowledge
> is send back, a timer with a timeout handling is running and will trigger
> a re-tranmission as well. Sending multiple ack's with the same sequence or
> messages with the same sequence should not have any effects that breaks
> dlm. Only messages in the far future can break dlm, that's why important
> that the closing connection is right synchronized with DLM_FIN which
> also resets the sequence numbers.
> 
> As RCOM_STATUS and RCOM_NAMES messages are the first messages which are
> exchanged and they have they own re-transmission handling, there exists
> logic that these messages must be first. If these messages arrives we
> store the dlm version field. This handling is on DLM 3.1 and after this
> patch 3.2 the same. A backwards compatibility handling has been added
> which seems to work on tests without tcpkill, however it's not recommended
> to use DLM 3.1 and 3.2 at the same time, because DLM 3.2 tries to fix long
> term bugs in the DLM protocol.
> 
> Signed-off-by: Alexander Aring <aahringo@redhat.com>

