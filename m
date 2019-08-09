Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFF787C70
	for <lists+cluster-devel@lfdr.de>; Fri,  9 Aug 2019 16:16:52 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8301A30B9AC4;
	Fri,  9 Aug 2019 14:16:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9501760933;
	Fri,  9 Aug 2019 14:16:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 166C12551C;
	Fri,  9 Aug 2019 14:16:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x79EFLWE029995 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 9 Aug 2019 10:15:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 745E11001B07; Fri,  9 Aug 2019 14:15:21 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 608861001958;
	Fri,  9 Aug 2019 14:15:21 +0000 (UTC)
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A7E4A89C3B;
	Fri,  9 Aug 2019 14:15:19 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id v16so15765948lfg.11;
	Fri, 09 Aug 2019 07:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xu1/l+VZ4TpJxAN6hjRxCgr4tvyD4vhXoKsk44aGA3U=;
	b=b7D5/BoCHbUrKkfnjLwzmv6UdXKJyXB7WLPrYJx96GEiZ2kOTn8aIUkg7zgA40nYI6
	3phmi9kzST7d+QuN9UCFQZieElTCRLHtZtLlXnp4sOskIDUBpl39WOmRFWFs8v2UYhC5
	Iy95K6yRqO5+n5F9QinsJnWem4ZaDASi6XvC9mMDFzzjVNJur9oktT0ro7H0NZQg6DJh
	EGr2VGUnJc7aUf3e04CrgtSOXK44htUIiHstAEurVEkffCvY6uwi+srzNS0sAYySn9YI
	3+oXLYl/Sixrpcb/leTMH1HTUXunBdiTHNNLOBeFeYctBQe9lFXOxGkrUsOztzRm6WQn
	L2hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xu1/l+VZ4TpJxAN6hjRxCgr4tvyD4vhXoKsk44aGA3U=;
	b=nilTHE6sKTvDxq3EoUoibCL9pshlckjIHb8sGfgJkKUVG47lr6nm2kJfaLH65imJds
	VG85ykzYIszC5vZlyWbrZpu7RdVpXkqeapoWKYHJJ1NHMna64bv+KE9ECySo0c52ViiG
	oPe9F7B7atS9aJvwFGE1Tf86XrYET+4MMI9nGtoTvAGLh35PL6zHLEk3fXE9pqk6NZi2
	UO0TWGPZ+gBu+Na5u4O7asD8LE0QEqYxfb9uts7HUd2319n2cEYxdzw6IU1wYAslUCu+
	a/HKuci4QOLDZeZeupl/F3gTykTCSsZ/uKXnvJRQxfJ9cUBO+QQPIccC+ZHqcIPstQTJ
	xLVA==
X-Gm-Message-State: APjAAAXw2iinLAqR+liA22wq+TBAlV9mJfYm5TZ2ylikcjXVv7ZdAChM
	YUYVAV5UDvSETjjOfrpRe+G6JgIpeCGgtNQ9nv5yh4RZcKk=
X-Google-Smtp-Source: APXvYqyS+u+PuYsOGDfPcS+oVWfr1aE+zNXu35WRiXZYBUamF+6GhQonFP3J6lVphUXISv1j2HjVzyu2C56vwe8f0E8=
X-Received: by 2002:ac2:5b09:: with SMTP id v9mr12718784lfn.22.1565360117684; 
	Fri, 09 Aug 2019 07:15:17 -0700 (PDT)
MIME-Version: 1.0
References: <OFA15B94C2.57C7D335-ON49258451.002CE1A7@skku.ac.kr>
	<297cee57-8ee4-8f07-9f4b-357e5f272ab5@redhat.com>
	<CAARcW+rvKJV1o3kcCGueh42oYSAvReiuOLY+KO6vR+7C+e_OGg@mail.gmail.com>
	<92318ae4-319a-3c10-5568-78c2d1c5259f@redhat.com>
	<CAARcW+qwyxA7V26k8hs8NPASuYrmi75tfY06Hz5ei5O66AretA@mail.gmail.com>
	<dc403e01-3517-72af-e0ec-b5287089f135@redhat.com>
In-Reply-To: <dc403e01-3517-72af-e0ec-b5287089f135@redhat.com>
From: Daegyu Han <hdg9400@gmail.com>
Date: Fri, 9 Aug 2019 23:15:02 +0900
Message-ID: <CAARcW+px=TTA0aZ41yB5yHSc=ynSBoJs=N1KiM_WhsAYcc1q9A@mail.gmail.com>
To: Andrew Price <anprice@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000c29dfb058fafcdf4"
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 09 Aug 2019 14:15:20 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]);
	Fri, 09 Aug 2019 14:15:20 +0000 (UTC) for IP:'209.85.167.65'
	DOMAIN:'mail-lf1-f65.google.com' HELO:'mail-lf1-f65.google.com'
	FROM:'hdg9400@gmail.com' RCPT:''
X-RedHat-Spam-Score: 0.152  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM,
	HTML_FONT_LOW_CONTRAST, HTML_MESSAGE, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.167.65 mail-lf1-f65.google.com 209.85.167.65
	mail-lf1-f65.google.com <hdg9400@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.27
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Fri, 09 Aug 2019 14:16:50 +0000 (UTC)

--000000000000c29dfb058fafcdf4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for your explanation.

=E1=90=A7

2019=EB=85=84 8=EC=9B=94 9=EC=9D=BC (=EA=B8=88) =EC=98=A4=ED=9B=84 9:26, An=
drew Price <anprice@redhat.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:

> On 09/08/2019 12:46, Daegyu Han wrote:
> > Thank you for the clarification.
> >
> > I have one more question.
> >
> > I've seen some web page by redhat and it says that gfs2 has a poor
> > filesystem performance (i.e. throughput) compared to xfs or ext4.
> > [image: image.png]
> >
> > In a high performance hardware environment (nvme over fabric, infiniban=
d
> > (56G)), I ran a FIO benchmark, expecting GFS2 to be comparable to local
> > filesystems (ext4, xfs).
> >
> > Unexpectedly, however, GFS2 showed 25% lower IOPS or throughput than
> ext4,
> > as the web page results.
> >
> > Does GFS2 perform worse than EXT4 or XFS even on high-performance
> network +
> > storage?
>
> gfs2 has performance overheads that ext4 and xfs don't encounter due to
> the extra work it has to do to keep the fs consistent across the
> cluster, such as the extra cache invalidation we've discussed, journal
> flushing and updates to structures relating to quotas and statfs. Even
> in a single-node configuration, extra codepaths are still active (but
> gfs2 isn't meant to be used as a single-node fs, so fio is not a good
> demonstration of its strengths). It's also worth noting that gfs2 is not
> extent-based so you may see performance differences relating to that. We
> are continually working to minimise the overheads, of course.
>
> The size of the performance difference is highly dependent on the
> workload and access pattern. (Clustered) applications looking to get the
> best performance out of gfs2 will have each node processing its own
> working set - preferably in its own subdirectory - which will minimise
> the overheads.
>
> Cheers,
> Andy
>
> > Thank you,
> > Daegyu
> > =E1=90=A7
> >
> > 2019=EB=85=84 8=EC=9B=94 9=EC=9D=BC (=EA=B8=88) =EC=98=A4=ED=9B=84 8:26=
, Andrew Price <anprice@redhat.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
> >
> >> On 09/08/2019 12:01, Daegyu Han wrote:
> >>> Thank you for your reply.
> >>>
> >>> If what I understand is correct,
> >>> In a gfs2 file system shared by clients A and B, if A creates
> /foo/a.txt,
> >>> does B re-read the filesystem metadata area on storage to keep the da=
ta
> >>> consistent?
> >>
> >> Yes, that's correct, although 'clients' is inaccurate as there is no
> >> 'server'. Through the locking mechanism, B would know to re-read block
> >> allocation states and the contents of the /foo directory, so a path
> >> lookup on B would then find a.txt.
> >>
> >>> After all, what makes gfs2 different from local filesystems like ext4=
,
> >>> because of lock_dlm?
> >>
> >> Exactly.
> >>
> >>> In general, if we mount an ext4 file system on two different clients
> and
> >>> update the file system on each client, we know that the file system
> state
> >>> is not reflected in each other.
> >>
> >> Yes.
> >>
> >> Cheers,
> >> Andy
> >>
> >>> Thank you,
> >>> Daegyu
> >>> =E1=90=A7
> >>>
> >>> 2019=EB=85=84 8=EC=9B=94 9=EC=9D=BC (=EA=B8=88) =EC=98=A4=ED=9B=84 7:=
50, Andrew Price <anprice@redhat.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
> >>>
> >>>> Hi Daegyu,
> >>>>
> >>>> On 09/08/2019 09:10, =ED=95=9C=EB=8C=80=EA=B7=9C wrote:
> >>>>> Hi, I'm Daegyu from Sungkyunkwan University.
> >>>>>
> >>>>> I'm curious how GFS2's filesystem metadata is shared between nodes.
> >>>>
> >>>> The key thing to know about gfs2 is that it is a shared storage
> >>>> filesystem where each node mounts the same storage device. It is
> >>>> different from a distributed filesystem where each node has storage
> >>>> devices that only it accesses.
> >>>>
> >>>>> In detail, I wonder how the metadata in the memory of the node
> mounting
> >>>> GFS2
> >>>>> looks the consistent filesystem to other nodes.
> >>>>
> >>>> gfs2 uses dlm for locking of filesystem metadata among the nodes. Th=
e
> >>>> transfer of locks between nodes allows gfs2 to decide when its
> in-memory
> >>>> caches are invalid and require re-reading from the storage.
> >>>>
> >>>>> In addition, what role does corosync play in gfs2?
> >>>>
> >>>> gfs2 doesn't communicate with corosync directly but it operates on t=
op
> >>>> of a high-availability cluster. corosync provides synchronization an=
d
> >>>> coherency for the cluster. If a node stops responding, corosync will
> >>>> notice and trigger actions (fencing) to make sure that node is put
> back
> >>>> into a safe and consistent state. This is important in gfs2 to preve=
nt
> >>>> "misbehaving" nodes from corrupting the filesystem.
> >>>>
> >>>> Hope this helps.
> >>>>
> >>>> Cheers,
> >>>> Andy
> >>>>
> >>>>
> >>>>
> >>>
> >>
> >
>

--000000000000c29dfb058fafcdf4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you for your explanation.=C2=A0<br><div><br></div></=
div><div hspace=3D"streak-pt-mark" style=3D"max-height:1px"><img alt=3D"" s=
tyle=3D"width:0px;max-height:0px;overflow:hidden" src=3D"https://mailfoogae=
.appspot.com/t?sender=3DaaGRnOTQwMEBnbWFpbC5jb20%3D&amp;type=3Dzerocontent&=
amp;guid=3Db0d8c7ca-1054-453d-b727-56cbfa1cd357"><font color=3D"#ffffff" si=
ze=3D"1">=E1=90=A7</font></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">2019=EB=85=84 8=EC=9B=94 9=EC=9D=BC (=EA=B8=88) =
=EC=98=A4=ED=9B=84 9:26, Andrew Price &lt;<a href=3D"mailto:anprice@redhat.=
com">anprice@redhat.com</a>&gt;=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">On 09/08/2019 12:46, =
Daegyu Han wrote:<br>
&gt; Thank you for the clarification.<br>
&gt; <br>
&gt; I have one more question.<br>
&gt; <br>
&gt; I&#39;ve seen some web page by redhat and it says that gfs2 has a poor=
<br>
&gt; filesystem performance (i.e. throughput) compared to xfs or ext4.<br>
&gt; [image: image.png]<br>
&gt; <br>
&gt; In a high performance hardware environment (nvme over fabric, infiniba=
nd<br>
&gt; (56G)), I ran a FIO benchmark, expecting GFS2 to be comparable to loca=
l<br>
&gt; filesystems (ext4, xfs).<br>
&gt; <br>
&gt; Unexpectedly, however, GFS2 showed 25% lower IOPS or throughput than e=
xt4,<br>
&gt; as the web page results.<br>
&gt; <br>
&gt; Does GFS2 perform worse than EXT4 or XFS even on high-performance netw=
ork +<br>
&gt; storage?<br>
<br>
gfs2 has performance overheads that ext4 and xfs don&#39;t encounter due to=
 <br>
the extra work it has to do to keep the fs consistent across the <br>
cluster, such as the extra cache invalidation we&#39;ve discussed, journal =
<br>
flushing and updates to structures relating to quotas and statfs. Even <br>
in a single-node configuration, extra codepaths are still active (but <br>
gfs2 isn&#39;t meant to be used as a single-node fs, so fio is not a good <=
br>
demonstration of its strengths). It&#39;s also worth noting that gfs2 is no=
t <br>
extent-based so you may see performance differences relating to that. We <b=
r>
are continually working to minimise the overheads, of course.<br>
<br>
The size of the performance difference is highly dependent on the <br>
workload and access pattern. (Clustered) applications looking to get the <b=
r>
best performance out of gfs2 will have each node processing its own <br>
working set - preferably in its own subdirectory - which will minimise <br>
the overheads.<br>
<br>
Cheers,<br>
Andy<br>
<br>
&gt; Thank you,<br>
&gt; Daegyu<br>
&gt; =E1=90=A7<br>
&gt; <br>
&gt; 2019=EB=85=84 8=EC=9B=94 9=EC=9D=BC (=EA=B8=88) =EC=98=A4=ED=9B=84 8:2=
6, Andrew Price &lt;<a href=3D"mailto:anprice@redhat.com" target=3D"_blank"=
>anprice@redhat.com</a>&gt;=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:<br>
&gt; <br>
&gt;&gt; On 09/08/2019 12:01, Daegyu Han wrote:<br>
&gt;&gt;&gt; Thank you for your reply.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; If what I understand is correct,<br>
&gt;&gt;&gt; In a gfs2 file system shared by clients A and B, if A creates =
/foo/a.txt,<br>
&gt;&gt;&gt; does B re-read the filesystem metadata area on storage to keep=
 the data<br>
&gt;&gt;&gt; consistent?<br>
&gt;&gt;<br>
&gt;&gt; Yes, that&#39;s correct, although &#39;clients&#39; is inaccurate =
as there is no<br>
&gt;&gt; &#39;server&#39;. Through the locking mechanism, B would know to r=
e-read block<br>
&gt;&gt; allocation states and the contents of the /foo directory, so a pat=
h<br>
&gt;&gt; lookup on B would then find a.txt.<br>
&gt;&gt;<br>
&gt;&gt;&gt; After all, what makes gfs2 different from local filesystems li=
ke ext4,<br>
&gt;&gt;&gt; because of lock_dlm?<br>
&gt;&gt;<br>
&gt;&gt; Exactly.<br>
&gt;&gt;<br>
&gt;&gt;&gt; In general, if we mount an ext4 file system on two different c=
lients and<br>
&gt;&gt;&gt; update the file system on each client, we know that the file s=
ystem state<br>
&gt;&gt;&gt; is not reflected in each other.<br>
&gt;&gt;<br>
&gt;&gt; Yes.<br>
&gt;&gt;<br>
&gt;&gt; Cheers,<br>
&gt;&gt; Andy<br>
&gt;&gt;<br>
&gt;&gt;&gt; Thank you,<br>
&gt;&gt;&gt; Daegyu<br>
&gt;&gt;&gt; =E1=90=A7<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; 2019=EB=85=84 8=EC=9B=94 9=EC=9D=BC (=EA=B8=88) =EC=98=A4=ED=
=9B=84 7:50, Andrew Price &lt;<a href=3D"mailto:anprice@redhat.com" target=
=3D"_blank">anprice@redhat.com</a>&gt;=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1=
:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Hi Daegyu,<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; On 09/08/2019 09:10, =ED=95=9C=EB=8C=80=EA=B7=9C wrote:<br=
>
&gt;&gt;&gt;&gt;&gt; Hi, I&#39;m Daegyu from Sungkyunkwan University.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; I&#39;m curious how GFS2&#39;s filesystem metadata is =
shared between nodes.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; The key thing to know about gfs2 is that it is a shared st=
orage<br>
&gt;&gt;&gt;&gt; filesystem where each node mounts the same storage device.=
 It is<br>
&gt;&gt;&gt;&gt; different from a distributed filesystem where each node ha=
s storage<br>
&gt;&gt;&gt;&gt; devices that only it accesses.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; In detail, I wonder how the metadata in the memory of =
the node mounting<br>
&gt;&gt;&gt;&gt; GFS2<br>
&gt;&gt;&gt;&gt;&gt; looks the consistent filesystem to other nodes.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; gfs2 uses dlm for locking of filesystem metadata among the=
 nodes. The<br>
&gt;&gt;&gt;&gt; transfer of locks between nodes allows gfs2 to decide when=
 its in-memory<br>
&gt;&gt;&gt;&gt; caches are invalid and require re-reading from the storage=
.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; In addition, what role does corosync play in gfs2?<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; gfs2 doesn&#39;t communicate with corosync directly but it=
 operates on top<br>
&gt;&gt;&gt;&gt; of a high-availability cluster. corosync provides synchron=
ization and<br>
&gt;&gt;&gt;&gt; coherency for the cluster. If a node stops responding, cor=
osync will<br>
&gt;&gt;&gt;&gt; notice and trigger actions (fencing) to make sure that nod=
e is put back<br>
&gt;&gt;&gt;&gt; into a safe and consistent state. This is important in gfs=
2 to prevent<br>
&gt;&gt;&gt;&gt; &quot;misbehaving&quot; nodes from corrupting the filesyst=
em.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Hope this helps.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Cheers,<br>
&gt;&gt;&gt;&gt; Andy<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt; <br>
</blockquote></div>

--000000000000c29dfb058fafcdf4--

