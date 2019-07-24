Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 218DA72CCE
	for <lists+cluster-devel@lfdr.de>; Wed, 24 Jul 2019 13:04:17 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D02C830C34DF;
	Wed, 24 Jul 2019 11:04:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 44A625D71A;
	Wed, 24 Jul 2019 11:04:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 432A21800206;
	Wed, 24 Jul 2019 11:04:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6OB483A022785 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 24 Jul 2019 07:04:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D8A0C5D71C; Wed, 24 Jul 2019 11:04:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D324963624
	for <cluster-devel@redhat.com>; Wed, 24 Jul 2019 11:04:06 +0000 (UTC)
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
	[209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E48A989C37
	for <cluster-devel@redhat.com>; Wed, 24 Jul 2019 11:04:05 +0000 (UTC)
Received: by mail-oi1-f198.google.com with SMTP id y1so17913021oih.19
	for <cluster-devel@redhat.com>; Wed, 24 Jul 2019 04:04:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/PGdmNH9ZosM5P+0tPXpHlo7ysWhcQI6K0OZ3xAF8qM=;
	b=Oejh/SaSZm9pezYhlmflRszHW727muytocJ2lBwBdSjD/bJhhZYpNbHPe71wJnQqmy
	0X+SyGfYNMO/+0R/7BtM/rBkbG6wbhqY2lQmlhRpP85kkHTgXTDRBF7wPPEiTanH/eFl
	QOBFHrZuGTc0lvOkUMPIuoGATSYcddqNYFzRtYhxAvHv/AyX/+v1/UWeJM+7qmVua4Lg
	T4aehbX5Dkv8fBQMQWoQizNCpq1EoaH1IVtE8blQedV0rcSS48fJM5kMrJEgULdMJtPB
	gs06p6d2aP9H9U/s1NbaoH9kup723jjzGlsvl+BxDTJnoaRZVpkV5byeo9PN9oVY9+Vy
	ZKjQ==
X-Gm-Message-State: APjAAAUdEY3Gh0hAe3AFmcBxcxz51tGNNE+cdMcDYjXawz3KWunCtIoW
	/dZalxvNVr/IHV7RSdkG7ovrVKKcsmQJSQogttCp5qyP7LGLAe64OBTP924QG5t3V1astMy+u+F
	yh7HMNUpNwssHrl4p2OaCt0T4MwS13LtDuS+KCA==
X-Received: by 2002:a9d:7a90:: with SMTP id l16mr8801341otn.297.1563966245427; 
	Wed, 24 Jul 2019 04:04:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqweX6aTjrzWXLgEDPKPRamzhQzyDFHX7bVFA0+m3AJpypOQ7io3QnQUCLx+6kBJgrpJ4orFoDZ6GExQQpLwYXk=
X-Received: by 2002:a9d:7a90:: with SMTP id l16mr8801321otn.297.1563966245262; 
	Wed, 24 Jul 2019 04:04:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190724084303.1236-1-baijiaju1990@gmail.com>
	<2986ed32-9aad-8e9c-1373-1402b34e65ac@redhat.com>
	<20190724100207.GA7916@infradead.org>
	<380199a4-1864-d61a-1b9c-f21d4f3f8a32@redhat.com>
	<20190724102718.GA30071@infradead.org>
	<42a3501a-ff02-2b3d-850f-4ee1c014d815@redhat.com>
In-Reply-To: <42a3501a-ff02-2b3d-850f-4ee1c014d815@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 24 Jul 2019 13:03:53 +0200
Message-ID: <CAHc6FU4H5D9_puGhcBaEymgk_7g29JjvoDEqV=TrTf0ToHwXyw@mail.gmail.com>
To: Steven Whitehouse <swhiteho@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [PATCH] fs: gfs2: Fix a null-pointer
 dereference in gfs2_alloc_inode()
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Wed, 24 Jul 2019 11:04:15 +0000 (UTC)

On Wed, 24 Jul 2019 at 12:55, Steven Whitehouse <swhiteho@redhat.com> wrote:
> On 24/07/2019 11:27, Christoph Hellwig wrote:
> > On Wed, Jul 24, 2019 at 11:22:46AM +0100, Steven Whitehouse wrote:
> >> and it would have the same effect, so far as I can tell. I don't mind
> >> changing it, if that is perhaps a clearer way to write the same thing,
> >> rather than &ip->i_inode;
> > The cleanest thing is to not rely on any of that magic and write it
> > like all other file systems:
> >
> >       ip = kmem_cache_alloc
> >       if (!ip)
> >               retuturn NULL;
> >
> >       ...
> >
> >       return &ip->i_inode;
> >
> > Absolutely not point in trying to be clever here.
>
> Yes, that works too,

I'll change that ...

Andreas

