Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9972487891
	for <lists+cluster-devel@lfdr.de>; Fri,  9 Aug 2019 13:30:27 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 386E2C060209;
	Fri,  9 Aug 2019 11:30:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DE13310013A1;
	Fri,  9 Aug 2019 11:30:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 68C6F2551D;
	Fri,  9 Aug 2019 11:30:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x79B2BeI032647 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 9 Aug 2019 07:02:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2932310016EA; Fri,  9 Aug 2019 11:02:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 59EFD10016E8;
	Fri,  9 Aug 2019 11:02:07 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
	[209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 08137A23FF;
	Fri,  9 Aug 2019 11:02:06 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id x3so15452024lfn.6;
	Fri, 09 Aug 2019 04:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=D4aXdJF34aKfZXBGZbfRefJULcl7QQVPQ96lBUYtvGo=;
	b=DfC34uyqjWXMiA2qKjTjM8tDE8KzY9jGm9tMvXEgKq/RhT74036qq7A/cP2IkGQv0n
	CJiNQ9s4dZc+We6rVzkZy5qYbvLoKzIjmgBqvDkqxsUwuba/WQE7GjjKWv0xz8hmr+Ar
	1EBiDR0bLknmQ/Us5nLfNCYIWKTHpWG7R2gB3phl6maXnQ7tquUAVrftgXo/IyF2zbQI
	2ueH/CLZz6jtrkuDClUbMP05Jb4xrSlEdbINviOzZsRqftyPDE/hh7cDzvJhcAdnVENX
	dyA2UsefX4KEUQ2nyfXqsQQ1DLDALMuSNOPLK6Nj6LkiHJZSGeCj5LPMBMnG0XLZ5D2Z
	JeLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=D4aXdJF34aKfZXBGZbfRefJULcl7QQVPQ96lBUYtvGo=;
	b=Dy/OoSbPrpypl/WOJ4GN1VVepQZyfsOKEsBmtbupCH17Z/pFvk+YSzRJBnOEI0LXbP
	5ws9VzDG6Kr3TdRdiKkl8qT9fg/Z+kxPlYQRdjzI7Gw54DH4DER9cbPclL+omXTkajWX
	/2ACqNErvm+daU2VcqtnBYPOMdYzPlEahP+vTXvGsIGN76+2D6z0EoCdwvsYKd65W9Ir
	uND/lZ7YM/fQISnhfMcgmskvlAsqgS+0wrGmdFA6rvT4S992aqnPKN2E1Fw/5an0nLud
	hqJECjE0nnttnNpKfeSmtL6vpImjIEVh69y3F8Mvc0cqKKvPrfavG9iP030ahUJFbKv9
	/zig==
X-Gm-Message-State: APjAAAXApNiSHk9O+JMaJpbJM7KT9jHV15qtIkmFmxhuMECalq6Cz3KX
	Em6aJzdYAyee8FyMIpDeO4OGkBYvm5MbkCeNqxYLXAwGOxM=
X-Google-Smtp-Source: APXvYqxartNNpKjeSXdPvhztwGCZT9Yoxkvx4hUeWvCf2U8GtLb37KxBlHp0j7Ej27zjP1XyxRf9WAkdryVa/68Jgfo=
X-Received: by 2002:ac2:5b09:: with SMTP id v9mr12226344lfn.22.1565348524022; 
	Fri, 09 Aug 2019 04:02:04 -0700 (PDT)
MIME-Version: 1.0
References: <OFA15B94C2.57C7D335-ON49258451.002CE1A7@skku.ac.kr>
	<297cee57-8ee4-8f07-9f4b-357e5f272ab5@redhat.com>
In-Reply-To: <297cee57-8ee4-8f07-9f4b-357e5f272ab5@redhat.com>
From: Daegyu Han <hdg9400@gmail.com>
Date: Fri, 9 Aug 2019 20:01:53 +0900
Message-ID: <CAARcW+rvKJV1o3kcCGueh42oYSAvReiuOLY+KO6vR+7C+e_OGg@mail.gmail.com>
To: Andrew Price <anprice@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000b961e2058fad1a3d"
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 09 Aug 2019 11:02:06 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Fri, 09 Aug 2019 11:02:06 +0000 (UTC) for IP:'209.85.167.43'
	DOMAIN:'mail-lf1-f43.google.com' HELO:'mail-lf1-f43.google.com'
	FROM:'hdg9400@gmail.com' RCPT:''
X-RedHat-Spam-Score: 0.889  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM,
	HTML_FONT_LOW_CONTRAST, HTML_IMAGE_ONLY_28, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	T_REMOTE_IMAGE) 209.85.167.43 mail-lf1-f43.google.com 209.85.167.43
	mail-lf1-f43.google.com <hdg9400@gmail.com>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Fri, 09 Aug 2019 07:30:21 -0400
Cc: =?UTF-8?B?7ZWc64yA6rec?= <hdg9400@skku.edu>, cluster-devel@redhat.com
Subject: Re: [Cluster-devel] How can be metadata(e.g.,
 inode) in the GFS2 file system shared between client nodes?
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Fri, 09 Aug 2019 11:30:26 +0000 (UTC)

--000000000000b961e2058fad1a3d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for your reply.

If what I understand is correct,
In a gfs2 file system shared by clients A and B, if A creates /foo/a.txt,
does B re-read the filesystem metadata area on storage to keep the data
consistent?

After all, what makes gfs2 different from local filesystems like ext4,
because of lock_dlm?

In general, if we mount an ext4 file system on two different clients and
update the file system on each client, we know that the file system state
is not reflected in each other.

Thank you,
Daegyu
=E1=90=A7

2019=EB=85=84 8=EC=9B=94 9=EC=9D=BC (=EA=B8=88) =EC=98=A4=ED=9B=84 7:50, An=
drew Price <anprice@redhat.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:

> Hi Daegyu,
>
> On 09/08/2019 09:10, =ED=95=9C=EB=8C=80=EA=B7=9C wrote:
> > Hi, I'm Daegyu from Sungkyunkwan University.
> >
> > I'm curious how GFS2's filesystem metadata is shared between nodes.
>
> The key thing to know about gfs2 is that it is a shared storage
> filesystem where each node mounts the same storage device. It is
> different from a distributed filesystem where each node has storage
> devices that only it accesses.
>
> > In detail, I wonder how the metadata in the memory of the node mounting
> GFS2
> > looks the consistent filesystem to other nodes.
>
> gfs2 uses dlm for locking of filesystem metadata among the nodes. The
> transfer of locks between nodes allows gfs2 to decide when its in-memory
> caches are invalid and require re-reading from the storage.
>
> > In addition, what role does corosync play in gfs2?
>
> gfs2 doesn't communicate with corosync directly but it operates on top
> of a high-availability cluster. corosync provides synchronization and
> coherency for the cluster. If a node stops responding, corosync will
> notice and trigger actions (fencing) to make sure that node is put back
> into a safe and consistent state. This is important in gfs2 to prevent
> "misbehaving" nodes from corrupting the filesystem.
>
> Hope this helps.
>
> Cheers,
> Andy
>
>
>

--000000000000b961e2058fad1a3d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you for your reply.<br><div><br></div><div>If what I=
 understand is correct,<br>In a gfs2 file system shared by clients A and B,=
 if A creates /foo/a.txt, does B re-read the filesystem metadata area on st=
orage to keep the data consistent?<br></div><div><br></div><div>After all, =
what makes gfs2 different from local filesystems like ext4, because of lock=
_dlm?<br></div><div><br></div><div>In general, if we mount an ext4 file sys=
tem on two different clients and update the file system on each client, we =
know that the file system state is not reflected in each other.<br></div><d=
iv><br></div><div>Thank you,</div><div>Daegyu</div></div><div hspace=3D"str=
eak-pt-mark" style=3D"max-height:1px"><img alt=3D"" style=3D"width:0px;max-=
height:0px;overflow:hidden" src=3D"https://mailfoogae.appspot.com/t?sender=
=3DaaGRnOTQwMEBnbWFpbC5jb20%3D&amp;type=3Dzerocontent&amp;guid=3D65e36952-5=
26a-45e4-99fd-92131f932988"><font color=3D"#ffffff" size=3D"1">=E1=90=A7</f=
ont></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">2019=EB=85=84 8=EC=9B=94 9=EC=9D=BC (=EA=B8=88) =EC=98=A4=ED=9B=84 7:50=
, Andrew Price &lt;<a href=3D"mailto:anprice@redhat.com">anprice@redhat.com=
</a>&gt;=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hi Daegyu,<br>
<br>
On 09/08/2019 09:10, =ED=95=9C=EB=8C=80=EA=B7=9C wrote:<br>
&gt; Hi, I&#39;m Daegyu from Sungkyunkwan University.<br>
&gt; <br>
&gt; I&#39;m curious how GFS2&#39;s filesystem metadata is shared between n=
odes.<br>
<br>
The key thing to know about gfs2 is that it is a shared storage <br>
filesystem where each node mounts the same storage device. It is <br>
different from a distributed filesystem where each node has storage <br>
devices that only it accesses.<br>
<br>
&gt; In detail, I wonder how the metadata in the memory of the node mountin=
g GFS2<br>
&gt; looks the consistent filesystem to other nodes.<br>
<br>
gfs2 uses dlm for locking of filesystem metadata among the nodes. The <br>
transfer of locks between nodes allows gfs2 to decide when its in-memory <b=
r>
caches are invalid and require re-reading from the storage.<br>
<br>
&gt; In addition, what role does corosync play in gfs2?<br>
<br>
gfs2 doesn&#39;t communicate with corosync directly but it operates on top =
<br>
of a high-availability cluster. corosync provides synchronization and <br>
coherency for the cluster. If a node stops responding, corosync will <br>
notice and trigger actions (fencing) to make sure that node is put back <br=
>
into a safe and consistent state. This is important in gfs2 to prevent <br>
&quot;misbehaving&quot; nodes from corrupting the filesystem.<br>
<br>
Hope this helps.<br>
<br>
Cheers,<br>
Andy<br>
<br>
<br>
</blockquote></div>

--000000000000b961e2058fad1a3d--

