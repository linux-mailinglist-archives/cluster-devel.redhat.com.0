Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 21A71396786
	for <lists+cluster-devel@lfdr.de>; Mon, 31 May 2021 19:57:44 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-6thNL2VFPDKmF9Z4xzA5FQ-1; Mon, 31 May 2021 13:57:41 -0400
X-MC-Unique: 6thNL2VFPDKmF9Z4xzA5FQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B506501E0;
	Mon, 31 May 2021 17:57:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2674310074EF;
	Mon, 31 May 2021 17:57:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8EE5955346;
	Mon, 31 May 2021 17:57:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14VHvW2Q023061 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 31 May 2021 13:57:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 84B6353D6; Mon, 31 May 2021 17:57:32 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7EFF4778C
	for <cluster-devel@redhat.com>; Mon, 31 May 2021 17:57:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A87080D0E3
	for <cluster-devel@redhat.com>; Mon, 31 May 2021 17:57:30 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
	[209.85.167.51]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-562-DzIJ6fSON6mjUTacVF4fUA-1; Mon, 31 May 2021 13:57:26 -0400
X-MC-Unique: DzIJ6fSON6mjUTacVF4fUA-1
Received: by mail-lf1-f51.google.com with SMTP id w33so17866526lfu.7
	for <cluster-devel@redhat.com>; Mon, 31 May 2021 10:57:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KAUYadnTw7VJHbDqses7xfJDE0hYF2SvozEuuZImjIU=;
	b=LZAvTwX5z3Qst5X4uzQzJ8oSEfcgZeOkJNfJzCQjg69XWSbVtezhEkzu7gMJAg25nN
	yberaJfPXfR4J9LChGjZBCGBLYlbOuEA7pIM6O3z19OR15rOYjYyM3NBoabxTDB6evV1
	RAku9ii39m+V0UJ6KQFUt0oA6kcW5Dmq3Tc5b6omgRSfVN0+sSrj5MnDh/Dk5cUDOILs
	XUhp1M1wjP1Zn8+bbNYk/s3WWa0hz9i4ftFxKVkO/+U6/t+Z0Jc9v/4OJor0SHFoD5TH
	vl+lJ/k6MyyBtQiSXkPdu2QM7/pwB4+isGPqhhPygwUcjQK0fM3RqmrQ1/pHbhLI0mZ7
	j1Ew==
X-Gm-Message-State: AOAM531iR/U1DchwIA/tS+RmJVul91rI4pmw+sniEsj+Msc5c9f1L4NE
	sriFQ0tQc7RCfXBOWoSMCRzFmqM5ATtOjV/C
X-Google-Smtp-Source: ABdhPJwH1C1aZ0aYsot+2A4b+rJdb4Gn8ACJ25gj5AXoPb8GgGHS2Y6ZlvC9SBRDiMTUv3lO5k33pQ==
X-Received: by 2002:a05:6512:38c4:: with SMTP id
	p4mr16043855lft.314.1622483845005; 
	Mon, 31 May 2021 10:57:25 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com.
	[209.85.208.177])
	by smtp.gmail.com with ESMTPSA id y1sm1328947lfl.68.2021.05.31.10.57.24
	for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 31 May 2021 10:57:24 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id s25so15924891ljo.11
	for <cluster-devel@redhat.com>; Mon, 31 May 2021 10:57:24 -0700 (PDT)
X-Received: by 2002:a2e:c52:: with SMTP id o18mr17117820ljd.411.1622483843727; 
	Mon, 31 May 2021 10:57:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210531170123.243771-1-agruenba@redhat.com>
In-Reply-To: <20210531170123.243771-1-agruenba@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 31 May 2021 07:57:11 -1000
X-Gmail-Original-Message-ID: <CAHk-=wgX=fZ+y=SxBsod8CvZmZ0-X7vZ6dV6EgLPkpBXbt=nQQ@mail.gmail.com>
Message-ID: <CAHk-=wgX=fZ+y=SxBsod8CvZmZ0-X7vZ6dV6EgLPkpBXbt=nQQ@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>,
	Al Viro <viro@zeniv.linux.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [Cluster-devel] [RFC 0/9] gfs2: handle page faults during read
	and write
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000029203205c3a3f547"

--00000000000029203205c3a3f547
Content-Type: text/plain; charset="UTF-8"

Sorry, I'm on a boat right now, with only a cellphone. Which is why this
html mess email, and quick reply.

Due to the html, this may get a bounce from the mailing list, and only make
it to the personal email recipients. Feel free to quote more just in case
others didn't get my original email through the lists.

I'll be out most of the day, but I'll try to take a deeper look this
evening.

I'm the meantime, a couple of questions and comments..

On Mon, May 31, 2021, 07:01 Andreas Gruenbacher <agruenba@redhat.com> wrote:

>
> here's a set of fixes for how gfs2 handles page faults during read and
> write syscalls.


So how much of this is due to the confusion you just introduced where you
pointlessly and incorrectly take an exclusive luck for write faults?

See my reply to that pull request for why it's wrong and pointless.

  The patch queue is ready for merging except for two
> open issues.
>

There is no way this series is acceptable for 5.13. This kind of change is
very much a merge window thing. Much much too late to make fundamental
locking changes. Maybe it can then be backported to stable (including at
that point 5.13 of course) if it's been shown to be ok.

This deadlock is not new, we've very much had the same kind of thing when
writing to a file in the generic filemap_write() function, where we take
the page lock and then copy from user space. If that copy faults, and needs
the same page for the source due to an odd mmap issue (usually malicious),
you get a deadlock on the page lock it you aren't careful.

I'm surprised that gfs2 hasn't seen this, I thought we had fstests for it.
And I'd have expected that case to also trigger any internal gfs2 issues,
although it's possible that the generic code just does such a good job at
avoiding the issue that we'd need another test for your case.

      Linus

>

--00000000000029203205c3a3f547
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Sorry, I&#39;m on a boat right now, with only a cell=
phone. Which is why this html mess email, and quick reply.</div><div dir=3D=
"auto"><br></div><div dir=3D"auto">Due to the html, this may get a bounce f=
rom the mailing list, and only make it to the personal email recipients. Fe=
el free to quote more just in case others didn&#39;t get my original email =
through the lists.<br><div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;l=
l be out most of the day, but I&#39;ll try to take a deeper look this eveni=
ng.</div><br>I&#39;m the meantime, a couple of questions and comments..</di=
v><div dir=3D"auto"><br><div class=3D"gmail_quote" dir=3D"auto"><div dir=3D=
"ltr" class=3D"gmail_attr">On Mon, May 31, 2021, 07:01 Andreas Gruenbacher =
&lt;<a href=3D"mailto:agruenba@redhat.com">agruenba@redhat.com</a>&gt; wrot=
e:</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">
<br>
here&#39;s a set of fixes for how gfs2 handles page faults during read and<=
br>
write syscalls.</blockquote></div></div><div dir=3D"auto"><br></div><div di=
r=3D"auto">So how much of this is due to the confusion you just introduced =
where you pointlessly and incorrectly take an exclusive luck for write faul=
ts?</div><div dir=3D"auto"><br></div><div dir=3D"auto">See my reply to that=
 pull request for why it&#39;s wrong and pointless.</div><div dir=3D"auto">=
<br></div><div dir=3D"auto"><div class=3D"gmail_quote" dir=3D"auto"><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">=C2=A0 The patch queue is ready for merging except =
for two<br>
open issues.=C2=A0=C2=A0<br></blockquote></div></div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">There is no way this series is acceptable for 5.13.=
 This kind of change is very much a merge window thing. Much much too late =
to make fundamental locking changes. Maybe it can then be backported to sta=
ble (including at that point 5.13 of course) if it&#39;s been shown to be o=
k.</div><div dir=3D"auto"><br></div><div dir=3D"auto">This deadlock is not =
new, we&#39;ve very much had the same kind of thing when writing to a file =
in the generic filemap_write() function, where we take the page lock and th=
en copy from user space. If that copy faults, and needs the same page for t=
he source due to an odd mmap issue (usually malicious), you get a deadlock =
on the page lock it you aren&#39;t careful.</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">I&#39;m surprised that gfs2 hasn&#39;t seen this, I tho=
ught we had fstests for it. And I&#39;d have expected that case to also tri=
gger any internal gfs2 issues, although it&#39;s possible that the generic =
code just does such a good job at avoiding the issue that we&#39;d need ano=
ther test for your case.</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>=C2=A0 =C2=A0 =C2=A0 Linus</div><div dir=3D"auto"><div class=3D"gmail_quot=
e" dir=3D"auto"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--00000000000029203205c3a3f547--

