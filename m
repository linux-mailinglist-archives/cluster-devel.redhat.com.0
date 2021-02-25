Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1DE9E325629
	for <lists+cluster-devel@lfdr.de>; Thu, 25 Feb 2021 20:08:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614280120;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=sLg2aMtn/mezeI7Diuwjo1/VlHaO12vEMyMbdn3/F9Y=;
	b=UcfscgZ/+DR4cvUm7kI5i+AXIEPh1BVVrsGMtJ3LLG7/P341nYEnfizIvYNOXZ4mJJRNSn
	FZBr0kBodqlWKK08Xoj6IbEt/cZi0pBtYyXlOLp5UPBSTbiVaCuFYbron1/KCTQsNamJgb
	6SaxJk6IeOAZB08Yc8qfO5FUFXkozwg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-5NnNbXTGMEqTE9_95hrl1w-1; Thu, 25 Feb 2021 14:08:37 -0500
X-MC-Unique: 5NnNbXTGMEqTE9_95hrl1w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB4558018A6;
	Thu, 25 Feb 2021 19:08:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F010189B4;
	Thu, 25 Feb 2021 19:08:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3A8DA18095CB;
	Thu, 25 Feb 2021 19:08:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11PJ8U2d015737 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 25 Feb 2021 14:08:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E819310A1439; Thu, 25 Feb 2021 19:08:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E386E10A1440
	for <cluster-devel@redhat.com>; Thu, 25 Feb 2021 19:08:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6015A9595C6
	for <cluster-devel@redhat.com>; Thu, 25 Feb 2021 19:08:26 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
	[209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-458-_3UdRoxCMjaBRUqKuwi7mw-1; Thu, 25 Feb 2021 14:08:23 -0500
X-MC-Unique: _3UdRoxCMjaBRUqKuwi7mw-1
Received: by mail-wr1-f71.google.com with SMTP id b15so1792044wrm.1
	for <cluster-devel@redhat.com>; Thu, 25 Feb 2021 11:08:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=sLg2aMtn/mezeI7Diuwjo1/VlHaO12vEMyMbdn3/F9Y=;
	b=kbP9Uaz5FPJJA2bxvwcJMhqqcLPcqqlDhJXAbQhkxr5s/F4gqCV4Y13jPfuAggdM7P
	905DMmQyQG1KIS+7esnVMk6tJDNY7tu7N+DdQunSjG2q3xK+jn+5MOapWMWtnQGK/Rc4
	qoKXVnxFh1zNBn89u2Gt18nsR16EcMcBvb4dhJXEIsG6AvWVETAEDjHfHQntyRPcRqiU
	KqcF7cYkSFs+RDzEnGoUmR1BTb9GS0Y2byE3Cm1K0rZe8lJS3xBXyY5+QQFcKxbe8qqr
	v9umZksB0/xgBMoFU1lOM/ZUCGxC1rBSwwsIp+tJW15zi9E5mVj7rP9Hh+mfexU8yKid
	EjPA==
X-Gm-Message-State: AOAM5322HW3t1vEdIO4AEixPZstf57uCjzvbXXavU6P8g+jEbTOrX6ei
	qsa1dsmIf3hpFycVpqaZhS/yRElY04/bgjOw1Pl8bjx3phqk0SQ08BhUMpz2lqyyxmRsksyYriK
	PYmay2Fytdnma9L6WkFNU1Ng4cwtoi0svUWRc1Q==
X-Received: by 2002:a05:600c:4eca:: with SMTP id
	g10mr4560704wmq.149.1614280102629; 
	Thu, 25 Feb 2021 11:08:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxoi5yn5oNX759kb8aOskcHYOqPwbaSDW0P1QIT7Koh/EzTIvnHWXI0h7qISZltWfkEchuyMBSNF3M+MC771js=
X-Received: by 2002:a05:600c:4eca:: with SMTP id
	g10mr4560686wmq.149.1614280102403; 
	Thu, 25 Feb 2021 11:08:22 -0800 (PST)
MIME-Version: 1.0
References: <CACrDRjiiXtz6cOO8FmnZHKte2EVKAFzDESXJ5a8oALd7h+EizA@mail.gmail.com>
	<CACrDRjjOgEsqOSWK1PeMro4WQxKkmR=KEfCCRQzBGCwtY+fevQ@mail.gmail.com>
	<93452e4c-af81-225f-34f5-f297473164ae@redhat.com>
	<CAHc6FU6jQ3KGgKgQHy_WaX-40nqWxGbJNqmAcSFtJPweR7AtQg@mail.gmail.com>
	<cd213bd4-3bc0-bb8f-0e8f-de2a26a62731@redhat.com>
	<CAHc6FU4C1FaLjxZmz5USHS+Nruthto4WYhxqkW0wjB_h8tX6=g@mail.gmail.com>
	<CAHc6FU6fs+Oizg4acpn-afLW1atRrnHmfDx5F0YV3RjMvqe_Aw@mail.gmail.com>
	<899455839.58326316.1614278886083.JavaMail.zimbra@redhat.com>
In-Reply-To: <899455839.58326316.1614278886083.JavaMail.zimbra@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 25 Feb 2021 20:08:11 +0100
Message-ID: <CAHc6FU6xpZJmuX2gQB9qrOGg+Cnh=OSUVrij9G6vQmn9nDaC7Q@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] Recording extents in GFS2
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
Content-Type: multipart/alternative; boundary="000000000000128c1a05bc2de06f"

--000000000000128c1a05bc2de06f
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 25, 2021 at 7:48 PM Bob Peterson <rpeterso@redhat.com> wrote:

> ----- Original Message -----
> > >> once we change the journal format, in addition to recording block
> numbers
> > >> as extents, there are some additional issues we should address at the
> same
> > >> time:
>
> One thing I've always thought we should improve upon was the way we manage
> our bitmaps. Right now, if you allocate or free a block, unless it's on the
> first block of the rgrp, we need to write two blocks: (1) One for the
> bitmap
> that needs to change and, (2) Another for the rgrp to adjust its allocated
> and
> free numbers. The rgrplvb code will make this faster, but it would be nice
> if
> we would somehow keep "version 2" bitmaps such that each keeps its own
> statistics.
>
> That way we only need to journal and write the affected bitmap, and not
> necessarily its rgrp block as well. I could see us keep separate glocks
> for each bitmap, for example, and allowing multiple nodes to work on the
> same portion of the file system, but on unique bitmaps.
>

On the other hand, we currently only need to look at the first block of
each resource group to figure out if a resource group is suitable for an
allocation. If we move that information into the bitmap blocks, we'll have
to look at each of those blocks instead. That's not going to improve our
performance.

Andreas

--000000000000128c1a05bc2de06f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, Feb 25, 2021 at 7:48 PM Bob Peterson &lt;<a href=3D"mailto:r=
peterso@redhat.com">rpeterso@redhat.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">----- Original Message -----<br>
&gt; &gt;&gt; once we change the journal format, in addition to recording b=
lock numbers<br>
&gt; &gt;&gt; as extents, there are some additional issues we should addres=
s at the same<br>
&gt; &gt;&gt; time:<br>
<br>
One thing I&#39;ve always thought we should improve upon was the way we man=
age<br>
our bitmaps. Right now, if you allocate or free a block, unless it&#39;s on=
 the<br>
first block of the rgrp, we need to write two blocks: (1) One for the bitma=
p<br>
that needs to change and, (2) Another for the rgrp to adjust its allocated =
and<br>
free numbers. The rgrplvb code will make this faster, but it would be nice =
if<br>
we would somehow keep &quot;version 2&quot; bitmaps such that each keeps it=
s own statistics.<br>
<br>
That way we only need to journal and write the affected bitmap, and not<br>
necessarily its rgrp block as well. I could see us keep separate glocks<br>
for each bitmap, for example, and allowing multiple nodes to work on the<br=
>
same portion of the file system, but on unique bitmaps.<br></blockquote><di=
v><br></div><div>On the other hand, we currently only need to look at the f=
irst block of each resource group to figure out if a resource group is suit=
able for an allocation. If we move that information into the bitmap blocks,=
 we&#39;ll have to look at each of those blocks instead. That&#39;s not goi=
ng to improve our performance.<br></div><div><br></div><div>Andreas<br>
</div></div></div>

--000000000000128c1a05bc2de06f--

