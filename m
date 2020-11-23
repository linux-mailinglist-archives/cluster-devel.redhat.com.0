Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 96F442C1892
	for <lists+cluster-devel@lfdr.de>; Mon, 23 Nov 2020 23:40:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1606171253;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=gWH3K54G1ip0OA/whJ8ttGxAkuTqjVve9v8MenmDy/o=;
	b=WzbsgLQVIfhcxiMuC2Ab1h0f6PUEGlLObKo/PdqlSIi8Z/hljrc9tjRmxpAhq71ZPJDjDk
	llCJ+1oySteW+ETHsJ7LvY3Phw8HSaMBCYzkEa2j17w7tAjP3meU8n2R/WmI9czgM3l6ny
	YKgXUOJtP7mNPSFGo8xPM3FPOsUzAZo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-74-x-yZaSaLO8OxTX-UmjKLDw-1; Mon, 23 Nov 2020 17:40:51 -0500
X-MC-Unique: x-yZaSaLO8OxTX-UmjKLDw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 224BE879524;
	Mon, 23 Nov 2020 22:40:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 687375D6DC;
	Mon, 23 Nov 2020 22:40:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3E6E25002C;
	Mon, 23 Nov 2020 22:40:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ANMefRd003123 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 23 Nov 2020 17:40:41 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5CD271112873; Mon, 23 Nov 2020 22:40:41 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 59675100404E
	for <cluster-devel@redhat.com>; Mon, 23 Nov 2020 22:40:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 32150103B801
	for <cluster-devel@redhat.com>; Mon, 23 Nov 2020 22:40:38 +0000 (UTC)
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
	[209.85.166.199]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-347-bkJ8PqPeO56iqaMzL-U_Mw-1; Mon, 23 Nov 2020 17:40:36 -0500
X-MC-Unique: bkJ8PqPeO56iqaMzL-U_Mw-1
Received: by mail-il1-f199.google.com with SMTP id r3so15339436ila.3
	for <cluster-devel@redhat.com>; Mon, 23 Nov 2020 14:40:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gWH3K54G1ip0OA/whJ8ttGxAkuTqjVve9v8MenmDy/o=;
	b=QxRzFKvSHzWFgAdWFLcORcTP2Boeavpqxac7O9Olxh9oeOuB+hCoeLe8rpnYOxrEui
	n67h/REhH1PgdUu0rjuzEPa9NQjtkgjH2Gf9W13iL4LDmnmRa8H+3x34XRpjQkFXubah
	KJQJeJqBKpZwSxC1/qV2FzDFWQlaE0iCkYH5DQ6ZSEJ0zx0bxd2ponGi0TWGJd3S9KzO
	InmVIUDX7ISz4aPm56fvbgRV2WkXjQqiJdJ3HACFlcM4u42A6cdfdd2nGvRlALqPUIey
	+fPyo5ZrlasJJiKqcM3ggIo+NZ9Wid7ecWr61mTNrFHwJjEcnjlrKuMh8TOdZzvJSWW+
	6kLg==
X-Gm-Message-State: AOAM532nHHEBvwHV/bwBCC+uRY4BhQ5ETnY1q4afv36E9XEi5RTb69TW
	XvzJ1BdcPDNKmyqOBsT4JkeoTJpvsY08ySY1hyl8/4vIsG5X/YjnzeRyANwjj3SaVf8l9pYLtCF
	jbHSNCfI+YOP6AMh8lZdvkh38fAOSgDtUT4FChA==
X-Received: by 2002:a5d:898c:: with SMTP id m12mr1684378iol.196.1606171235355; 
	Mon, 23 Nov 2020 14:40:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzbyJoy0pDQ713idMKfZuAPN/8lGgEQy9p8i3gAT8KtqFatN400buBud/8tb+gbTF7ErIkBb+QqzIcdXTDnSwk=
X-Received: by 2002:a5d:898c:: with SMTP id m12mr1684374iol.196.1606171235237; 
	Mon, 23 Nov 2020 14:40:35 -0800 (PST)
MIME-Version: 1.0
References: <20201113225814.461167-1-aahringo@redhat.com>
	<20201113225814.461167-16-aahringo@redhat.com>
In-Reply-To: <20201113225814.461167-16-aahringo@redhat.com>
From: Alexander Ahring Oder Aring <aahringo@redhat.com>
Date: Mon, 23 Nov 2020 17:40:24 -0500
Message-ID: <CAK-6q+h5YgKegssa=-5Zjpi7FSzYuwyy5EJuOkxRKv-nhRqa0g@mail.gmail.com>
To: David Teigland <teigland@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Fri, Nov 13, 2020 at 5:58 PM Alexander Aring <aahringo@redhat.com> wrote:
>
...
> +
> +               p = (union dlm_packet *)((unsigned char *)p->opts.o_opts + ret);
> +

actually this needs to be:

p = (union dlm_packet *)((unsigned char *)p->opts.o_opts +
le16_to_cpu(p->opts.o_optlen));

otherwise it would break if we add options because we would not "jump
over" the header.

- Alex

