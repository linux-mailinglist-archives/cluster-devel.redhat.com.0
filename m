Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D0598180E8
	for <lists+cluster-devel@lfdr.de>; Wed,  8 May 2019 22:17:34 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B4F33C0601F2;
	Wed,  8 May 2019 20:17:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 51A151001E64;
	Wed,  8 May 2019 20:17:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2B12C41F58;
	Wed,  8 May 2019 20:17:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x48KHQTw029745 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 8 May 2019 16:17:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 72C815DA38; Wed,  8 May 2019 20:17:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CF235D9D1
	for <cluster-devel@redhat.com>; Wed,  8 May 2019 20:17:24 +0000 (UTC)
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
	[209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 37AE9C0601F2
	for <cluster-devel@redhat.com>; Wed,  8 May 2019 20:17:24 +0000 (UTC)
Received: by mail-oi1-f200.google.com with SMTP id w13so4080271oih.22
	for <cluster-devel@redhat.com>; Wed, 08 May 2019 13:17:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=M13siEu+g10Eyf72ko5YRm3P5jSDytOXC9psBac97xQ=;
	b=fT6+a66uFN85mF6OVxBC4VqfMGRDs0jbbvbzbRbDY10PCW6MhiX12VcEJx8PYPGcig
	VT6Nrzx6qbxybReENXegG1/dxFxo+ywhhwwngsK/AM+hquQpUy51Ixmk7+9zSwlkEFxi
	7Ex9MIaiM94bWIBEPuvHnjeZDbRmNc52rki1lKRf1m+9Qt2nhUxxhm9tECYSjcfuuJTH
	a2Bg3I1029XZvecVezEnY0KrzrQjSAt344rFJicy+YwxL47hirizcywTqVrtvgNa9xY8
	nfhQiNq/lLBaUpwDcWCwvOO0rvASz83mfZXPi7Fl0eHERladtzRFUxM/iCzmae3+HL01
	QsJQ==
X-Gm-Message-State: APjAAAUjg0mq2q03F1flJVnQltKqtJRMGmHMWWcLIR9iBGFGcCi31Ky3
	wM2KMk7/swBsbfYN5zwfReElIfGYmEcbOGKU5gY/3lan7QsXyTJ3A7ntpLZ3Hqg98a2YeEszVYp
	QYUdYh3mCZLUcY8eNeKuv4gvClgWrcgvq/SzniA==
X-Received: by 2002:a9d:4d02:: with SMTP id n2mr476235otf.332.1557346643513;
	Wed, 08 May 2019 13:17:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwSWGUNTGH2G86hxTfu40xvKgy0wCqrVfneJnSvUzw3Yu8TSikFVN7lIOFZ7TE029cKTDMP3egLTajjHZ5G1Vw=
X-Received: by 2002:a9d:4d02:: with SMTP id n2mr476227otf.332.1557346643306;
	Wed, 08 May 2019 13:17:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAHc6FU5Yd9EVju+kY8228n-Ccm7F2ZBRJUbesT-HYsy2YjKc_w@mail.gmail.com>
	<CAHk-=wj_L9d8P0Kmtb5f4wudm=KGZ5z0ijJ-NxTY-CcNcNDP5A@mail.gmail.com>
	<CAHk-=whbrADQrEezs=-t0QsKw-qaVU_2s2DqxLAkcczxc62SLQ@mail.gmail.com>
In-Reply-To: <CAHk-=whbrADQrEezs=-t0QsKw-qaVU_2s2DqxLAkcczxc62SLQ@mail.gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 8 May 2019 22:17:12 +0200
Message-ID: <CAHc6FU40HucCUzx5k2obs8m6dXS08NmXBM-tFOq7fSbLduHiGw@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>, "Tobin C. Harding" <me@tobin.cc>
Subject: Re: [Cluster-devel] GFS2: Pull Request
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Wed, 08 May 2019 20:17:33 +0000 (UTC)

Linus,

On Wed, 8 May 2019 at 20:06, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Wed, May 8, 2019 at 10:55 AM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > See what I'm saying? You would ask me to pull the un-merged state, but
> > then say "I noticed a few merge conflicts when I did my test merge,
> > and this is what I did" kind of aside.
>
> Side note: this is more important if you know of a merge issue that
> doesn't cause a conflict, and that I won't see in my simple build
> tests.
>
> For example, in this case, the merge issue doesn't cause a conflict
> (because it's a totally new user of bio_for_each_segment_all() and the
> syntax changed in another branch), but I see it trivially when I do a
> test build, since the compiler spews out lots of warnings, and so I
> can trivially fix it up (and you _mentioning_ the issue gives me the
> heads up that you knew about it and what it's all about).
>
> But if it's other architectures, or only happens under special config
> options etc, I might not have seen the merge issue at all. And then
> it's really good if the maintainer talks about it and shows that yes,
> the maintainer knows what he's doing.
>
> Now I'm in the situation where I have actually done the merge the way
> I *like* doing them, and without your superfluous merge commit. But if
> I use my merge, I'll lose the signature from your tag, because you
> signed *your* merge that I didn't actually want to use at all.
>
> See? Your "helpful" merge actually caused me extra work, and made me
> have to pick one of two *worse* situations than if you had just tagged
> your own development tree. Either my tree has a extra pointless merge
> commit, or my tree lacks your signature on your work.

Ok, got it.

Would it make sense to describe how to deal with merge conflicts in
Documentation/maintainer/pull-requests.rst to stop people from getting
this wrong over and over again?

Thanks,
Andreas

