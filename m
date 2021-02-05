Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 05EC83112CB
	for <lists+cluster-devel@lfdr.de>; Fri,  5 Feb 2021 21:51:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612558273;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=nhZlta/lqUeD8/KDbYx+CVNMCKEghYuLo0T68Q6feGE=;
	b=M5EN/W9f1sn7nHgPRuluiVBOUadULOw0KjpFIlzgn25+ev0FiXFCp4DhQLlts3/lKTvilZ
	uLhYJR/JySfpYcbkmtFj1r+xhbpVSW3+CA5wygcGVx5OYIza0/Ec84+9DK2Lt/KiOe4ZXq
	HD3H6LDcmc6CfroHG4TBZ0uHz0dNL18=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-c2NaaiT6MuavbZ9uRq23Eg-1; Fri, 05 Feb 2021 15:51:11 -0500
X-MC-Unique: c2NaaiT6MuavbZ9uRq23Eg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 061E01005501;
	Fri,  5 Feb 2021 20:51:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D2545D71D;
	Fri,  5 Feb 2021 20:51:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DF2AD18095CC;
	Fri,  5 Feb 2021 20:51:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 115KoxTI022071 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 5 Feb 2021 15:50:59 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A1A12115145; Fri,  5 Feb 2021 20:50:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9CE5D114CC7
	for <cluster-devel@redhat.com>; Fri,  5 Feb 2021 20:50:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C549980B928
	for <cluster-devel@redhat.com>; Fri,  5 Feb 2021 20:50:55 +0000 (UTC)
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
	[209.85.166.199]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-278-vPOODPIVPlaUeKQXn5ht0A-1; Fri, 05 Feb 2021 15:50:54 -0500
X-MC-Unique: vPOODPIVPlaUeKQXn5ht0A-1
Received: by mail-il1-f199.google.com with SMTP id s74so7381445ilb.20
	for <cluster-devel@redhat.com>; Fri, 05 Feb 2021 12:50:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nhZlta/lqUeD8/KDbYx+CVNMCKEghYuLo0T68Q6feGE=;
	b=lXHBTt/Dx//KYpR60oFrjfTUXy8MV6i0qFa1WwQGiN2rhfMY9R39XdFqM4y6IlO/B+
	U05UTeQuHw/JRwJODEx7VlMumjWKFo3Lb+kOz+P9D+p+zkWLh8WVWtbKuZY1+6dgWgqu
	0PvdVQH8I/q2B+Gol3s+2h/K0hCqFdYJ65LasZQfv8jRCW8edup+UNhkz0Q3lYbRJwlw
	B9uHhGq8/bpfgsrjqGAKeUuNB7aDEG+JwVkcoLUbjWMbRtzEuuj1w1etF41fkCyEj7N9
	4EFw2uB2TgT3QVYiDVptvXW4QEFhJkkJC5WLmXjqrXM1Dixgo6mI2HEqwjSJDl4ZzA9+
	MEMA==
X-Gm-Message-State: AOAM531mWA0c/tZ+81sL8rHakhUA+CIQOknCzLg26K1sMwTCH3sEEJIx
	oTFOfCSwuWjRtYnmgQWpl3Db6h2sYYtJHXuD1x2Endbnjl1Pe/efxjkYi9vTfyyHBpHpqnmvJp0
	kKXVxyOx3lN6+mxnzeGgIVO1oIARv0eM3XmdX0Q==
X-Received: by 2002:a05:6e02:188e:: with SMTP id
	o14mr2431496ilu.76.1612558253442; 
	Fri, 05 Feb 2021 12:50:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+oSKjNB9rXc7jtHhcDqywqaAizRUmuafQ8bHiG3j39XjsgTRyIFVo9g8HOWRUZgPoi7yYUAhP97KjMt4fBwk=
X-Received: by 2002:a05:6e02:188e:: with SMTP id
	o14mr2431476ilu.76.1612558253235; 
	Fri, 05 Feb 2021 12:50:53 -0800 (PST)
MIME-Version: 1.0
References: <20210204215056.774409-1-aahringo@redhat.com>
	<20210204215056.774409-9-aahringo@redhat.com>
In-Reply-To: <20210204215056.774409-9-aahringo@redhat.com>
From: Alexander Ahring Oder Aring <aahringo@redhat.com>
Date: Fri, 5 Feb 2021 15:50:42 -0500
Message-ID: <CAK-6q+hg+HTCyABcW9cfmmp1Mab7__-dzMFZTejXg2VL1Faurg@mail.gmail.com>
To: David Teigland <teigland@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH dlm/next 8/9] fs: dlm: check on dlm
	header size
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Thu, Feb 4, 2021 at 4:51 PM Alexander Aring <aahringo@redhat.com> wrote:
>
> This patch adds checks for the dlm header size that the parsing loop
> will not stop on messages which are dlm header only and rejects msglen
> field of the dlm header which are less than dlm header size. A msglen
> field cannot be less than the dlm header size because the field is
> inclusive header lengths.
>
> Signed-off-by: Alexander Aring <aahringo@redhat.com>
> ---
>  fs/dlm/midcomms.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
> index fde3a6afe4be..7cda8e4be6fc 100644
> --- a/fs/dlm/midcomms.c
> +++ b/fs/dlm/midcomms.c
> @@ -42,16 +42,17 @@ int dlm_process_incoming_buffer(int nodeid, unsigned char *buf, int len)
>         uint16_t msglen;
>         int ret = 0;
>
> -       while (len >= sizeof(struct dlm_header)) {
> +       while (len > sizeof(struct dlm_header)) {

I am sorry, I fixed that in 4798cbbfbd00c498339bdcf4cc2429f53eb374ec
("fs: dlm: rework receive handling") already, the correct condition is
">=".
I will send a v2 for this one. Took me some time to debug this "again"
if it's ">" then sometimes ACK messages don't get parsed and I get
hangs at connection termination because ACK messages are only
dlm_header size long.

- Alex

