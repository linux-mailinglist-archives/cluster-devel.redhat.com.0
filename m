Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 7BB7D107BCA
	for <lists+cluster-devel@lfdr.de>; Sat, 23 Nov 2019 00:59:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574467184;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Lam5BBJ61QSb5bECRSmeboumzBcqTmEiCXsrKxxf7NM=;
	b=eahQbZgPWX0kBTkDJHW+Dw8CjFqr7ej7/lcFct4s+amIa61a0g7JwmrAixv2baTMPo/wx4
	4mv5ahz+wK0u5Xs1nWZureaEVmyAfARjEkDzOMJ++AZ5Yk5KJcclodAYcQVF5JrJc8tpNL
	MXdf3/Q0K6WLarhoSVSo9uN1fiiZTkU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-A9K_yS4NO_20PIc8XpyQXA-1; Fri, 22 Nov 2019 18:59:43 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AECFE107ACE5;
	Fri, 22 Nov 2019 23:59:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2748F5C1B5;
	Fri, 22 Nov 2019 23:59:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8C1034BB65;
	Fri, 22 Nov 2019 23:59:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAMNxaXG000894 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 22 Nov 2019 18:59:36 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A21592157F47; Fri, 22 Nov 2019 23:59:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DEFC2157F3E
	for <cluster-devel@redhat.com>; Fri, 22 Nov 2019 23:59:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 83D931804436
	for <cluster-devel@redhat.com>; Fri, 22 Nov 2019 23:59:34 +0000 (UTC)
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-375-j7wZ03l1ORyERxO3pxyhdw-1; Fri, 22 Nov 2019 18:59:30 -0500
Received: by mail-io1-f66.google.com with SMTP id s3so10146678ioe.3;
	Fri, 22 Nov 2019 15:59:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=foB4NLZVZpZHpEP+Jauf8VZD20bjVJasgM3S94B+BBs=;
	b=KI/DxSMCRjjQ5c2giYXVM2d1sEK50pv4ew7UHJQGPTfSXu1eKOUfxVWcayPgri23wE
	s5yqBJHcvv3KjRlWKRFJFsq/MrHB2L4JHeKn8uLuvJDzk/EN5e7UqcD7hMJ/jVa5zGwy
	L5KOCKUzW0Zxh3XllA/yvKk4oMUwR6sfGcFazJkUUhYKRZTcqkyqz91yYVgivgf8RMkJ
	wDN+ya8leJLHTtv7xHdtud2D9xj/DjUFV3tGWc1Od88cdFZwx6iC9+WmhqP2NtD4uej4
	F//aJfHg+eQ89v99rEdAwLshPTUhgwEQ4okSKeQGqsKP4qH4fZ1zSmPWpqwTo6jXeIg5
	KjZQ==
X-Gm-Message-State: APjAAAVQDRsDXek+eJlgoXSPpTgW9gvF0CTROFkqeXvF2lGeu0KlhyT9
	QBaUD9ZpbDYdNPq6lnndlTGXYQw8MT7Wvx0Hc65SCo3yh04=
X-Google-Smtp-Source: APXvYqxEYuoR4iMswSx1CzGapDzROgybF2PYu6v6V5p2Czm4oC+E00ZzOCe0P14r8QIPjTBrJxub730kaFAOaD4G31A=
X-Received: by 2002:a6b:7e0b:: with SMTP id i11mr15044163iom.245.1574467169363;
	Fri, 22 Nov 2019 15:59:29 -0800 (PST)
MIME-Version: 1.0
References: <157225677483.3442.4227193290486305330.stgit@buzz>
	<20191028124222.ld6u3dhhujfqcn7w@box>
	<CAHk-=wgQ-Dcs2keNJPovTb4gG33M81yANH6KZM9d5NLUb-cJ1g@mail.gmail.com>
	<20191028125702.xdfbs7rqhm3wer5t@box>
	<ac83fee6-9bcd-8c66-3596-2c0fbe6bcf96@yandex-team.ru>
	<CAHk-=who0HS=NT8U7vFDT7er_CD7+ZreRJMxjYrRXs5G6dbpyw@mail.gmail.com>
	<f0140b13-cca2-af9e-eb4b-82eda134eb8f@redhat.com>
	<CAHk-=wh4SKRxKQf5LawRMSijtjRVQevaFioBK+tOZAVPt7ek0Q@mail.gmail.com>
	<640bbe51-706b-8d9f-4abc-5f184de6a701@redhat.com>
In-Reply-To: <640bbe51-706b-8d9f-4abc-5f184de6a701@redhat.com>
From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Date: Sat, 23 Nov 2019 00:59:18 +0100
Message-ID: <CAHpGcM+o2OwXdrj+A2_OqRg6YokfauFNiBJF-BQp0dJFvq_BrQ@mail.gmail.com>
To: Steven Whitehouse <swhiteho@redhat.com>
X-MC-Unique: j7wZ03l1ORyERxO3pxyhdw-1
X-MC-Unique: A9K_yS4NO_20PIc8XpyQXA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAMNxaXG000894
X-loop: cluster-devel@redhat.com
Cc: Steve French <sfrench@samba.org>,
	Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Ronnie Sahlberg <lsahlber@redhat.com>,
	"cluster-devel@redhat.com" <cluster-devel@redhat.com>,
	Linux-MM <linux-mm@kvack.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
	Johannes Weiner <hannes@cmpxchg.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	"Kirill A. Shutemov" <kirill@shutemov.name>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [Cluster-devel] [PATCH] mm/filemap: do not allocate cache pages
 beyond end of file at read
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

Am Do., 31. Okt. 2019 um 12:43 Uhr schrieb Steven Whitehouse
<swhiteho@redhat.com>:
> Andreas, Bob, have I missed anything here?

I've looked into this a bit, and it seems that there's a reasonable
way to get rid of the lock taking in ->readpage and ->readpages
without a lot of code duplication. My proposal for that consists of
multiple patches, so I've posted it separately:

https://lore.kernel.org/linux-fsdevel/20191122235324.17245-1-agruenba@redha=
t.com/T/#t

Thanks,
Andreas


