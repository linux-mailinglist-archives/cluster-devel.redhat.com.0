Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9921E40062D
	for <lists+cluster-devel@lfdr.de>; Fri,  3 Sep 2021 21:52:24 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-70Eif03zOTqA4MxAcnGy_Q-1; Fri, 03 Sep 2021 15:52:22 -0400
X-MC-Unique: 70Eif03zOTqA4MxAcnGy_Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 604831883527;
	Fri,  3 Sep 2021 19:52:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D36D12D4A;
	Fri,  3 Sep 2021 19:52:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 826901809C98;
	Fri,  3 Sep 2021 19:52:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 183JqDTU023854 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 3 Sep 2021 15:52:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C6F671179A05; Fri,  3 Sep 2021 19:52:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C292D1179A0B
	for <cluster-devel@redhat.com>; Fri,  3 Sep 2021 19:52:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E4FDA101A54C
	for <cluster-devel@redhat.com>; Fri,  3 Sep 2021 19:52:10 +0000 (UTC)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
	[209.85.166.170]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-277-lKme8DkAPXuu5KrrpJDIYA-1; Fri, 03 Sep 2021 15:52:09 -0400
X-MC-Unique: lKme8DkAPXuu5KrrpJDIYA-1
Received: by mail-il1-f170.google.com with SMTP id u7so121873ilk.7;
	Fri, 03 Sep 2021 12:52:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JAQwIaNrcj0cnJzSYIM4xoGBJDQtqjvHaX1OMGcrhaI=;
	b=FTuI1/pr12zZaE7b2mzRx9HejuUmWDYC8dsThLX4WX/fhF5jbQ/lZ5NIbbdhtlmUGu
	rrTm93MZxpO5jNeZuQ1t/ZPBOcfh5lRg6xmu4K1TscK88LEgbxWybCm7KG5zSGhMH23c
	adf9UHN+YtyewG1rcZOvdotHSR/tKIx3kNgeLbCGWAeKkqUBNVcq2gimhwwOXMGS7tbg
	G6gRy2ezZw/+MezwLoVwCgortRJJLFLi0f0vWUg6bvHCq43ZWodm5sLyEz8TIo48+aiI
	FCPsXqTvG0NSTxbc16kQGBiShrpdi5Dw22ErhpDYJ/lV66cjpnjg2fZmhHx/Yn4rEIjs
	FF5A==
X-Gm-Message-State: AOAM530FsHhi9TeXpV0+qhqre10c+dSTzxH0JcP183XLe4zVZt2wZW2/
	ywfsKvZwqO+VTzoYW12yjBn6Rk841pTy6DxeITs=
X-Google-Smtp-Source: ABdhPJxg0vpZtt5/kAqsmHWcdUOrNEqv2hlMjkG3oqd+ff0a4tQP2bqnb+RfhjFnLpBElRtlUYVJ0RZntSRxiOo862Q=
X-Received: by 2002:a92:c5a7:: with SMTP id r7mr441940ilt.11.1630698728033;
	Fri, 03 Sep 2021 12:52:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210827164926.1726765-1-agruenba@redhat.com>
	<CAHk-=wiUtyoTWuzroNJQwQDM9GHRXvq4974VL=y8T_3tUxDbkA@mail.gmail.com>
	<CAHc6FU7K0Ho=nH6fCK+Amc7zEg2G31v+gE3920ric3NE4MfH=A@mail.gmail.com>
	<CAHk-=wjUs8qy3hTEy-7QX4L=SyS85jF58eiT2Yq2YMUdTFAgvA@mail.gmail.com>
In-Reply-To: <CAHk-=wjUs8qy3hTEy-7QX4L=SyS85jF58eiT2Yq2YMUdTFAgvA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Date: Fri, 3 Sep 2021 21:51:57 +0200
Message-ID: <CAHpGcMJuCRoVU79_fLFCWJ0Yp38A3Uvmnj5_pRtzGyCDro-avg@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: kvm-ppc@vger.kernel.org, Paul Mackerras <paulus@ozlabs.org>,
	cluster-devel <cluster-devel@redhat.com>,
	Jan Kara <jack@suse.cz>, "Darrick J. Wong" <djwong@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v7 00/19] gfs2: Fix mmap + page fault
	deadlocks
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000006bac0e05cb1ca288"

--0000000000006bac0e05cb1ca288
Content-Type: text/plain; charset="UTF-8"

Sorry for the HTML post: I'm travelling for the next two weeks and I'll
mostly be in read-only mode. Bob can help out during that time if
necessary, though.

Linus Torvalds <torvalds@linux-foundation.org> schrieb am Fr., 3. Sep.
2021, 18:20:

> On Wed, Sep 1, 2021 at 12:53 PM Andreas Gruenbacher <agruenba@redhat.com>
> wrote:
> >
> > So there's a minor merge conflict between Christoph's iomap_iter
> > conversion and this patch queue now, and I should probably clarify the
> > description of "iomap: Add done_before argument to iomap_dio_rw" that
> > Darrick ran into. Then there are the user copy issues that Al has
> > pointed out. Fixing those will create superficial conflicts with this
> > patch queue, but probably nothing serious.
> >
> > So how should I proceed: do you expect a v8 of this patch queue on top
> > of the current mainline?
>
> So if you rebase for fixes, it's going to be a "next merge window" thing
> again.
>
> Personally, I'm ok with the series as is, and the conflict isn't an
> issue. So I'd take it as is, and then people can fix up niggling
> issues later.
>

That sounds fine to me. We can clarify things as Darrick has suggested in a
separate commit.

Thanks,
Andreas

--0000000000006bac0e05cb1ca288
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Sorry for the HTML post: I&#39;m travelling for the =
next two weeks and I&#39;ll mostly be in read-only mode. Bob can help out d=
uring that time if necessary, though.<br><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">Linus Torvalds &lt;<a href=3D"mailto:tor=
valds@linux-foundation.org">torvalds@linux-foundation.org</a>&gt; schrieb a=
m Fr., 3. Sep. 2021, 18:20:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Wed,=
 Sep 1, 2021 at 12:53 PM Andreas Gruenbacher &lt;<a href=3D"mailto:agruenba=
@redhat.com" target=3D"_blank" rel=3D"noreferrer">agruenba@redhat.com</a>&g=
t; wrote:<br>
&gt;<br>
&gt; So there&#39;s a minor merge conflict between Christoph&#39;s iomap_it=
er<br>
&gt; conversion and this patch queue now, and I should probably clarify the=
<br>
&gt; description of &quot;iomap: Add done_before argument to iomap_dio_rw&q=
uot; that<br>
&gt; Darrick ran into. Then there are the user copy issues that Al has<br>
&gt; pointed out. Fixing those will create superficial conflicts with this<=
br>
&gt; patch queue, but probably nothing serious.<br>
&gt;<br>
&gt; So how should I proceed: do you expect a v8 of this patch queue on top=
<br>
&gt; of the current mainline?<br>
<br>
So if you rebase for fixes, it&#39;s going to be a &quot;next merge window&=
quot; thing again.<br>
<br>
Personally, I&#39;m ok with the series as is, and the conflict isn&#39;t an=
<br>
issue. So I&#39;d take it as is, and then people can fix up niggling<br>
issues later.<br></blockquote></div></div><div dir=3D"auto"><br></div><div =
dir=3D"auto">That sounds fine to me. We can clarify things as Darrick has s=
uggested in a separate commit.</div><div dir=3D"auto"><br></div><div dir=3D=
"auto">Thanks,</div><div dir=3D"auto">Andreas</div></div>

--0000000000006bac0e05cb1ca288--

