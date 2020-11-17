Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 190B62B6DAF
	for <lists+cluster-devel@lfdr.de>; Tue, 17 Nov 2020 19:48:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605638924;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=37xH0X311beZj2HFA8PUyASWCqYpyTIW2uAaqe6L9cI=;
	b=c7OcdYX0qB7FeLBNtqaicYqP6G3il6yd7Rwl1hKBMPhTmwOCULVdQoylcKEuVvup/yQbV/
	4i0RfHUsxZVtgcyM3Hmehbs3ExKb6jCr8/qpx2Gz5Yh3ntYHk14RtA8n1xmBUyuYYbRXKf
	T5A5atvKRB032fFWPBxvhaw2WKz8Aa0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-yp-QFQjnOsKKI65RVb5z6g-1; Tue, 17 Nov 2020 13:48:43 -0500
X-MC-Unique: yp-QFQjnOsKKI65RVb5z6g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2B94D8ECB;
	Tue, 17 Nov 2020 18:48:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B1B260C04;
	Tue, 17 Nov 2020 18:48:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6026258137;
	Tue, 17 Nov 2020 18:48:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AHImQK5027089 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 17 Nov 2020 13:48:26 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A166B2166BA0; Tue, 17 Nov 2020 18:48:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 967D42166BA3
	for <cluster-devel@redhat.com>; Tue, 17 Nov 2020 18:48:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E68F90E429
	for <cluster-devel@redhat.com>; Tue, 17 Nov 2020 18:48:23 +0000 (UTC)
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
	[209.85.166.197]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-591-w0dBHUw-NOGRzs6X7_-GTg-1; Tue, 17 Nov 2020 13:48:20 -0500
X-MC-Unique: w0dBHUw-NOGRzs6X7_-GTg-1
Received: by mail-il1-f197.google.com with SMTP id r3so3860833ila.3
	for <cluster-devel@redhat.com>; Tue, 17 Nov 2020 10:48:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=37xH0X311beZj2HFA8PUyASWCqYpyTIW2uAaqe6L9cI=;
	b=p49VDrE9WnEmsiDrm58/O9+ucuwWsSvN3dY/QMfryOKFGee//aQfP/l9MWxEzP7vsA
	4XBt8JIMcnqzN5UJLTk24YVsHMT0cZBl5pBxyEfVe6TKh5F+EihB/Zm+J+zUrWBhOTTU
	LP3Nze3nXgutfeytCPkCW2TolM0TtNuLYEgvlr19r3tLPDHfuLRiYRfgRPY9Sn4y4fiG
	g6V+I4IyJp5VfBrv60GAwKvRQVsIOLV7fCv6l98rXrq9A9xniSbXigdcxV91L5ebfyDv
	4GXiq8kGkN/EpyZMDTQmDVvgODeRZPUfzE1ShvkOFDEjgtp+TjA68qxmcmG4hzF7ND6D
	15Yg==
X-Gm-Message-State: AOAM531eLHg7fZIb/H0wN6dI3I5BUp1EkMqBJTx1iZ0kGwB3TNfS9HUp
	wNjW1NUA/o43VrBcRgyz0cMQ6DpucDAZbc+79UBWzMb+MCAmFTeNo5uRCOdgVe9RYgfjswGh0qk
	wpH/tiAj5GCR6quDly8WafB19K8JMrbo8tCTJNQ==
X-Received: by 2002:a05:6e02:92f:: with SMTP id
	o15mr13641313ilt.169.1605638899787; 
	Tue, 17 Nov 2020 10:48:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxwJhhUl7vocqFVfWZK8AzQnlnjzPuxlOxfVmAk1U9/QzmLM3He9nqz3wpgP76GcGakgmZ86LIg2TFAXYDun8M=
X-Received: by 2002:a05:6e02:92f:: with SMTP id
	o15mr13641294ilt.169.1605638899507; 
	Tue, 17 Nov 2020 10:48:19 -0800 (PST)
MIME-Version: 1.0
References: <20201113225814.461167-1-aahringo@redhat.com>
	<20201113225814.461167-16-aahringo@redhat.com>
In-Reply-To: <20201113225814.461167-16-aahringo@redhat.com>
From: Alexander Ahring Oder Aring <aahringo@redhat.com>
Date: Tue, 17 Nov 2020 13:48:08 -0500
Message-ID: <CAK-6q+hRP7AMBA1th_SE650dZx_De-Y_xhRmbPf9qdskWr7n0Q@mail.gmail.com>
To: David Teigland <teigland@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
..
> +                       /* we only alloc a new node at receiving for the above
> +                        * RCOM messages. It can be that the other side is
> +                        * already gone and we cannot ack FIN messages anymore,
> +                        * we ignore it until the other side runs into an
> +                        * timeout. FIN messages are application stateless and
> +                        * it's not imortant to be acked since it is the last
> +                        * message before disconnect.
> +                        *
> +                        * we don't print a warning in this case.
> +                        */
> +                       switch (p->opts.o_nextcmd) {
> +                       case DLM_ACK:
> +                               /* ignore ACK as well */
> +                               fallthrough;

This can't happen, DLM_ACK is never encapsulated by DLM_OPTS. I think
I saw once DLM_ACK messages arriving but the node was already
disconnected. I think we should print warnings in this case, the
warning is here when we are already disconnected and we don't see one
of the initial dlm messages as a new connection. This should always be
the case and if not something weird is going on.

One of my last changes in this patchset was to change the hook for the
remove member function, may that fixed the issue why I saw the DLM_ACK
but no node was "active".

I will remove this case.

- Alex

