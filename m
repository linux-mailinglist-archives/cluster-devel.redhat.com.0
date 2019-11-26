Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 4548E109ABA
	for <lists+cluster-devel@lfdr.de>; Tue, 26 Nov 2019 10:08:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574759321;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wCmd9UkZWRmYLxoT9dNBA1V4mhxxn/pQT3sKLLiknOM=;
	b=aVG/q3YjzYTLkXOpXTZe65tcGbiCt9OqPos2gAwrPV1nK20no1zwiVgqIjqIC0hnFBkojm
	TzBmcYmW/H1dl1DNJMYvlvYWDxhtdSnK0VfZ4W/fhuy4vwKA4QU9jvmh+oTn6BidJDZC4v
	YMW03GspKf61Bd4ZxLbx5I8cMxmsAss=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-tmeldYrrM6CqtFNURE4EOg-1; Tue, 26 Nov 2019 04:08:40 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5AA2E800EBC;
	Tue, 26 Nov 2019 09:08:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BA1D5D6BB;
	Tue, 26 Nov 2019 09:08:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3BF7118089CD;
	Tue, 26 Nov 2019 09:08:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAQ98Tkp024740 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 26 Nov 2019 04:08:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7C42720316DF; Tue, 26 Nov 2019 09:08:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 782272026D67
	for <cluster-devel@redhat.com>; Tue, 26 Nov 2019 09:08:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AFF14803ACF
	for <cluster-devel@redhat.com>; Tue, 26 Nov 2019 09:08:26 +0000 (UTC)
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-327-1gZWn5N9MPWf6ls8xoeXvA-1; Tue, 26 Nov 2019 04:08:24 -0500
Received: by mail-io1-f67.google.com with SMTP id p12so12334882iog.10;
	Tue, 26 Nov 2019 01:08:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DYoUaVnx+KyGsEJ9h6ubFDzA7o1Y91HlvowSyIB4u6g=;
	b=Bix+EcvUT8wlL+cckSa9m9Zm5imZCn1G4pBKw77K6+G27+VYZO23gMjYOgzsY65I/1
	Udh3WyV5Al0rStKhjW3A/tWjY46ulx7vKXowrVZPOiMcfe5sE8vphIuF2DuKbYZem4UJ
	6aJ+6ylthGqWkdbtg3qTQat2psBKmdyiXUH+5vv6L/0qcJP/IMXXW1/la3k2jWSq23QD
	W0bDv4YgZEWC3WoFGfWAjBopGqOVP8JK1LLmpfX+Tj/uEeVceRz6Roy/9Bw7Z635hqd+
	n9VVY9lJ2VUgb+SY2Q6TZlGw3HGjaKr383GwnKBqlcDSUqkrwqghl9dME6IUxWZiR+jl
	5Uqg==
X-Gm-Message-State: APjAAAV71n3x7ZOqR0qIEmSWyZyH6oD/XLLdwO3X/0Rn1l6+lpFdZ7QJ
	fus1SciMKXuKg53WCWnQDUlTbM1u44fLeWV+sGY=
X-Google-Smtp-Source: APXvYqyfjbm1xD9vJMPlCm9jiMuFO96a0z+melj0FGo+2YH0IFHnWzUAVKCPm12COPj5QhPmhZ6Ldd257xh8VpSNgoI=
X-Received: by 2002:a02:3403:: with SMTP id x3mr31741578jae.117.1574759303686; 
	Tue, 26 Nov 2019 01:08:23 -0800 (PST)
MIME-Version: 1.0
References: <20191122235324.17245-1-agruenba@redhat.com>
	<20191122235324.17245-4-agruenba@redhat.com>
	<20191125091508.3265wtfzpoupv2lj@box>
In-Reply-To: <20191125091508.3265wtfzpoupv2lj@box>
From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Date: Tue, 26 Nov 2019 10:08:12 +0100
Message-ID: <CAHpGcMJO_bzsc+9Ta7VoKkszR2_v1BqqBZ4=7re=j7OxcX-R1w@mail.gmail.com>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
X-MC-Unique: 1gZWn5N9MPWf6ls8xoeXvA-1
X-MC-Unique: tmeldYrrM6CqtFNURE4EOg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAQ98Tkp024740
X-loop: cluster-devel@redhat.com
Cc: Steve French <sfrench@samba.org>,
	Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Ronnie Sahlberg <lsahlber@redhat.com>,
	cluster-devel <cluster-devel@redhat.com>, Linux-MM <linux-mm@kvack.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [Cluster-devel] [RFC PATCH 3/3] gfs2: Rework read and page
	fault locking
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
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Mo., 25. Nov. 2019 um 10:16 Uhr schrieb Kirill A. Shutemov
<kirill@shutemov.name>:
> On Sat, Nov 23, 2019 at 12:53:24AM +0100, Andreas Gruenbacher wrote:
> > @@ -778,15 +804,51 @@ static ssize_t gfs2_file_direct_write(struct kioc=
b *iocb, struct iov_iter *from)
> >
> >  static ssize_t gfs2_file_read_iter(struct kiocb *iocb, struct iov_iter=
 *to)
> >  {
> > +     struct gfs2_inode *ip;
> > +     struct gfs2_holder gh;
> > +     size_t written =3D 0;
>
> 'written' in a read routine?

It's a bit weird, but it's the same as in generic_file_buffered_read.

> --
>  Kirill A. Shutemov

Thanks,
Andreas


