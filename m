Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 44B332C2A65
	for <lists+cluster-devel@lfdr.de>; Tue, 24 Nov 2020 15:51:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1606229473;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=CDWd+vT/JS6IXYhEM5EANDNqiUpEezfz/0UYDKIuq9c=;
	b=R6UVckPLYPj2qzm0oq2TiBZYHjiTqGxOyrQlt+HXcR9VN9lU3GBCvqY1I5pGxyEguhwaj/
	WoTPcjHXuGA/zTFXpjM/r3fpVuxukzJwMBYuCtC8P16rHsJux73JFrJ1dUHoWZkAyth58z
	9NbvIQ+BJuQaFxI++B5POV44k2cII3w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-PyhpZh3IO1KfN47D4BCp5w-1; Tue, 24 Nov 2020 09:51:09 -0500
X-MC-Unique: PyhpZh3IO1KfN47D4BCp5w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 880BF9A234;
	Tue, 24 Nov 2020 14:51:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A32E5D9C0;
	Tue, 24 Nov 2020 14:51:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E9168180954D;
	Tue, 24 Nov 2020 14:51:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AOEp2kq030772 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 24 Nov 2020 09:51:03 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B95B7112D43D; Tue, 24 Nov 2020 14:51:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B5BF8112D43E
	for <cluster-devel@redhat.com>; Tue, 24 Nov 2020 14:50:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5898E108C0A0
	for <cluster-devel@redhat.com>; Tue, 24 Nov 2020 14:50:59 +0000 (UTC)
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
	[209.85.166.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-464-09-tat0iPG2knilDLI0yRw-1; Tue, 24 Nov 2020 09:50:57 -0500
X-MC-Unique: 09-tat0iPG2knilDLI0yRw-1
Received: by mail-io1-f71.google.com with SMTP id y2so15691093ioy.8
	for <cluster-devel@redhat.com>; Tue, 24 Nov 2020 06:50:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CDWd+vT/JS6IXYhEM5EANDNqiUpEezfz/0UYDKIuq9c=;
	b=SDZPGzMwa3Vi/WSoE/q4K3p/ttf3pOxVmIQbuGLf8BK1MTTKdSVZ+say8Vv/kaShpa
	W+8TJGr7clWr8m8PPilkpM5C8VcQeJR1UlQ0w68wW6hjPlEMoJjuc8W8g6gVaKO1CVpf
	2fKKPNueW0Q94Vam1els5eDCAcPVUs9RdT40qlYu+dcNMjCSKj/eU6wdaG+Djgja7LxR
	oLH6ZgiTZ2IX4sY99FyjiF29LsSrqqczmy8lDWV+3zIUHKvJ8qdpKmhJ1wk11Tb9GGS9
	s9yeCLA6sboMjSVmRUmqmBe32sCElUo6iQ++X4UAGmM1PBVaSuwwBeUxEXTKPEbpriVn
	cf0g==
X-Gm-Message-State: AOAM533YpYN7K6wbbqAW39pjQDxWg+vgUP95I11zVq5WXM2+1iPyuFe+
	Ih+LSuKRSobQQQ6Dkgvc0Y8YyEy7HN7cXEqp8fWOkL8PuP2eQyvb7Iv6qrpF+24quzAiqmcWAfO
	LoHT769atdFg47lS9Sau5WHRDeqMk816Btt3j+A==
X-Received: by 2002:a6b:6c01:: with SMTP id a1mr4226727ioh.31.1606229456567;
	Tue, 24 Nov 2020 06:50:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyoF68E0FnTENNkwCB722ctjgmiOe8DgbiOtAKOG8nMQyJrX8xAy+10UNoF2WTXrGxXgnrasGVODuf+g+WfzCc=
X-Received: by 2002:a6b:6c01:: with SMTP id a1mr4226704ioh.31.1606229456279;
	Tue, 24 Nov 2020 06:50:56 -0800 (PST)
MIME-Version: 1.0
References: <20201113225814.461167-1-aahringo@redhat.com>
	<20201113225814.461167-13-aahringo@redhat.com>
In-Reply-To: <20201113225814.461167-13-aahringo@redhat.com>
From: Alexander Ahring Oder Aring <aahringo@redhat.com>
Date: Tue, 24 Nov 2020 09:50:45 -0500
Message-ID: <CAK-6q+hKdmrK7eRL56f_rA+6FGDcn-89Mmb1W_d7Mr8fxak4UA@mail.gmail.com>
To: David Teigland <teigland@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [RFC PATCH dlm/next 12/16] fs: dlm: remove
 unaligned memory access handling
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,


On Fri, Nov 13, 2020 at 5:58 PM Alexander Aring <aahringo@redhat.com> wrote:
>
> This patch removes unaligned memory access handling for receiving
> midcomms messages. The allocated receive buffer is always memory aligned
> as the code shows, but each dlm message length and their structure fields
> are always aligned to 4 bytes addresses so it should be fine to remove
> this special handling.
>
> Signed-off-by: Alexander Aring <aahringo@redhat.com>
> ---
>  fs/dlm/midcomms.c | 12 +-----------
>  1 file changed, 1 insertion(+), 11 deletions(-)
>
> diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
> index e058e017c77d..b146842be54a 100644
> --- a/fs/dlm/midcomms.c
> +++ b/fs/dlm/midcomms.c
> @@ -22,8 +22,6 @@
>   * into packets and sends them to the comms layer.
>   */
>
> -#include <asm/unaligned.h>
> -
>  #include "dlm_internal.h"
>  #include "lowcomms.h"
>  #include "config.h"
> @@ -96,7 +94,7 @@ int dlm_process_incoming_buffer(int nodeid, unsigned char *buf, int len)
>                 /* no message should be more than this otherwise we
>                  * cannot deliver this message to upper layers
>                  */
> -               msglen = get_unaligned_le16(&hd->h_length);
> +               msglen = le16_to_cpu(hd->h_length);
>                 if (msglen > DEFAULT_BUFFER_SIZE) {

I will change this condition to:

                if (msglen > DEFAULT_BUFFER_SIZE ||
                    msglen < sizeof(struct dlm_header) ||
                    DLM_MSGLEN_IS_NOT_ALIGNED(msglen)) {

As these must always be true for a valid dlm message, we disconnect
when seeing such a message. We cannot skip it because skipping
requires a valid msglen.

- Alex

