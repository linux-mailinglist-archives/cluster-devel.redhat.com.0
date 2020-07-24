Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0BA8922C749
	for <lists+cluster-devel@lfdr.de>; Fri, 24 Jul 2020 16:05:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595599502;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=SrjKBapPtCauYSxY80F/BRuhfRKROGP1uMRyyRTuMg8=;
	b=gV5jOnNMmUyCExq/X+8Xh0ofu8N0AlvWf/VupowcCwgKaJmkMOKG3dns7Iq5C63zYqvX2K
	YjocnajE7oC6Z/YuJ2/nmpY9a7NfkSQg1OQTzbzgzeRR3x1BmHD7KsFn/bj/jfN6EZzCYr
	/co1geS3xhXrjz5szRevEN1T6bK9Csg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-8bmYkNHJMrW_IU5yjdrYsw-1; Fri, 24 Jul 2020 10:04:57 -0400
X-MC-Unique: 8bmYkNHJMrW_IU5yjdrYsw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6796E8017FB;
	Fri, 24 Jul 2020 14:04:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 357B874F64;
	Fri, 24 Jul 2020 14:04:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3F8D8730E1;
	Fri, 24 Jul 2020 14:04:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06OE4jOY012555 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 24 Jul 2020 10:04:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7FEC7208DD86; Fri, 24 Jul 2020 14:04:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BE45208DD89
	for <cluster-devel@redhat.com>; Fri, 24 Jul 2020 14:04:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73E29858F04
	for <cluster-devel@redhat.com>; Fri, 24 Jul 2020 14:04:43 +0000 (UTC)
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
	[209.85.166.197]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-471-Gh6LdAQ5MduSFuOGjZzERw-1; Fri, 24 Jul 2020 10:04:41 -0400
X-MC-Unique: Gh6LdAQ5MduSFuOGjZzERw-1
Received: by mail-il1-f197.google.com with SMTP id c4so752877ilo.4
	for <cluster-devel@redhat.com>; Fri, 24 Jul 2020 07:04:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SrjKBapPtCauYSxY80F/BRuhfRKROGP1uMRyyRTuMg8=;
	b=iP50PlPxD3v5q8Valu9sHLFQvb8zxUDfaeamcIaoJusQ781ZJL8gN1BNMscmiLZuYL
	2ib3b8i8fCHluEInumBbWXvv6G05Q+Qyjd/djcfPQdrTIYuZuAQbDZtlDPRFbPIegS82
	z2zvTonhA8Rf13ORMQFOR4jS6HY3htQ4gDV0sjDK/Dx7VCqnuuX1pncx7T68hsof7Z8E
	0wk/ogr+YnVstTO76rJTj0circmPqJdqZgUzntJB/zKUbgTiO/7UFiG3gPfiSL1X0P9Y
	ecX/5AVA/ECgeMsb4QvEE/4j64ubHB/dNjR5fp3wxOlc1pvyFkZ1QJuM2Lf25lxX6pGL
	rSGw==
X-Gm-Message-State: AOAM533xlUqqOWVB7+14dUpaLh4SFrVPylZgvTSMiU7NhSR8THmo1RNA
	wVTusYHvo7FcRv8rJB1nLvXrBhbnOAg2DRzCB7L8V49gY2C8OXmHQ0Qs6oPFySaRZpmSninTOdf
	/PJVbmpwVSpS4LyhamJItS0zrMMJ3tU5THtVf2w==
X-Received: by 2002:a92:2802:: with SMTP id l2mr10290523ilf.169.1595599480836; 
	Fri, 24 Jul 2020 07:04:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzANkvWDaksKH7YBBh5rZFjfUpcT7j5USTgjfL4rgjFHZNkg7tZ5zvJhRtaET3SRAXBGx5GjbSc5fJpad85XPA=
X-Received: by 2002:a92:2802:: with SMTP id l2mr10290512ilf.169.1595599480632; 
	Fri, 24 Jul 2020 07:04:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200723144908.271110-1-aahringo@redhat.com>
	<20200723144908.271110-3-aahringo@redhat.com>
In-Reply-To: <20200723144908.271110-3-aahringo@redhat.com>
From: Alexander Ahring Oder Aring <aahringo@redhat.com>
Date: Fri, 24 Jul 2020 10:04:29 -0400
Message-ID: <CAK-6q+guZeX-S8vwL=2pa+9_LfsQTAuxhtDuOPMd5RSh_X0PWQ@mail.gmail.com>
To: David Teigland <teigland@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH dlm-next 2/4] fs: dlm: fix report error
	of invalid messages
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Thu, Jul 23, 2020 at 10:49 AM Alexander Aring <aahringo@redhat.com> wrote:
>
> This patch fix the error reporting of invalid messages, the return value
> of -EBADMSG is never returned by dlm_process_incoming_buffer(), so we
> just check for negative return values.
>
> Signed-off-by: Alexander Aring <aahringo@redhat.com>
> ---
>  fs/dlm/lowcomms.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
> index ec7ed228a9843..19b50d69babef 100644
> --- a/fs/dlm/lowcomms.c
> +++ b/fs/dlm/lowcomms.c
> @@ -685,9 +685,9 @@ static int receive_from_sock(struct connection *con)
>                                           page_address(con->rx_page),
>                                           con->cb.base, con->cb.len,
>                                           PAGE_SIZE);
> -       if (ret == -EBADMSG) {
> -               log_print("lowcomms: addr=%p, base=%u, len=%u, read=%d",
> -                         page_address(con->rx_page), con->cb.base,
> +       if (ret < 0) {
> +               log_print("lowcomms err %d: addr=%p, base=%u, len=%u, read=%d",
> +                         ret, page_address(con->rx_page), con->cb.base,
>                           con->cb.len, r);
>         }
>         cbuf_eat(&con->cb, ret);

found a problem here. This should be in an else branch of the
condition above. In case of ret < 0 we should call "cbuf_eat(&con->cb,
r);". I believe...
I will send a v2.

- Alex

