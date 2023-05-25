Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 660FC711A88
	for <lists+cluster-devel@lfdr.de>; Fri, 26 May 2023 01:21:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685056885;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=soZ24H8VbeWxfJDd8LB47BBo+kpFJ5/XMH1WV32FupM=;
	b=MEieW3XwhGk5h8tPcUXGU1C0TjZm7SKr+wmiz5v7A+IsbX1TkymeMrE0eYV2Vzpi6CRorX
	4JTalwPmg/E3IF5r5s/m6n1UKYYK4mkvKWKskfmsibXCLICUaXhjUoaDZDr9LyFkejf51B
	7ESnbVGqB/kfP8cb9RGtxlEzMd098G4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-206-HUzvwBqnNJSOLyJbmSIAxw-1; Thu, 25 May 2023 19:21:21 -0400
X-MC-Unique: HUzvwBqnNJSOLyJbmSIAxw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 344918032EF;
	Thu, 25 May 2023 23:21:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B8C5B492B00;
	Thu, 25 May 2023 23:21:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5FFCF19465B1;
	Thu, 25 May 2023 23:21:18 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7BAD919465A0 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 25 May 2023 23:21:03 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2FE2940CFD00; Thu, 25 May 2023 23:21:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2897B40CFD02
 for <cluster-devel@redhat.com>; Thu, 25 May 2023 23:21:03 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D39985A5A8
 for <cluster-devel@redhat.com>; Thu, 25 May 2023 23:21:03 +0000 (UTC)
Received: from out-9.mta1.migadu.com (out-9.mta1.migadu.com [95.215.58.9])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-386-hFbEjFRUOUqsGHRs0NJcsA-1; Thu,
 25 May 2023 19:20:53 -0400
X-MC-Unique: hFbEjFRUOUqsGHRs0NJcsA-1
Date: Thu, 25 May 2023 19:20:46 -0400
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Andreas =?utf-8?Q?Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Message-ID: <ZG/tTorh8G2919Jz@moria.home.lan>
References: <20230509165657.1735798-1-kent.overstreet@linux.dev>
 <20230509165657.1735798-7-kent.overstreet@linux.dev>
 <20230510010737.heniyuxazlprrbd6@quack3>
 <ZFs3RYgdCeKjxYCw@moria.home.lan>
 <20230523133431.wwrkjtptu6vqqh5e@quack3>
 <ZGzoJLCRLk+pCKAk@infradead.org>
 <CAHpGcML0CZ1RGkOf26iYt_tK0Ux=cfdW8d3bjMVbjXLr91cs+g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHpGcML0CZ1RGkOf26iYt_tK0Ux=cfdW8d3bjMVbjXLr91cs+g@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [Cluster-devel] [PATCH 06/32] sched: Add
 task_struct->faults_disabled_mapping
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: cluster-devel@redhat.com, dhowells@redhat.com, Jan Kara <jack@suse.cz>,
 "Darrick J . Wong" <djwong@kernel.org>, linux-kernel@vger.kernel.org,
 linux-bcachefs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Kent Overstreet <kent.overstreet@gmail.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.dev
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 26, 2023 at 12:25:31AM +0200, Andreas Gr=C3=BCnbacher wrote:
> Am Di., 23. Mai 2023 um 18:28 Uhr schrieb Christoph Hellwig <hch@infradea=
d.org>:
> > On Tue, May 23, 2023 at 03:34:31PM +0200, Jan Kara wrote:
> > > I've checked the code and AFAICT it is all indeed handled. BTW, I've =
now
> > > remembered that GFS2 has dealt with the same deadlocks - b01b2d72da25
> > > ("gfs2: Fix mmap + page fault deadlocks for direct I/O") - in a diffe=
rent
> > > way (by prefaulting pages from the iter before grabbing the problemat=
ic
> > > lock and then disabling page faults for the iomap_dio_rw() call). I g=
uess
> > > we should somehow unify these schemes so that we don't have two mecha=
nisms
> > > for avoiding exactly the same deadlock. Adding GFS2 guys to CC.
> > >
> > > Also good that you've written a fstest for this, that is definitely a=
 useful
> > > addition, although I suspect GFS2 guys added a test for this not so l=
ong
> > > ago when testing their stuff. Maybe they have a pointer handy?
> >
> > generic/708 is the btrfs version of this.
> >
> > But I think all of the file systems that have this deadlock are actuall=
y
> > fundamentally broken because they have a mess up locking hierarchy
> > where page faults take the same lock that is held over the the direct I=
/
> > operation.  And the right thing is to fix this.  I have work in progres=
s
> > for btrfs, and something similar should apply to gfs2, with the added
> > complication that it probably means a revision to their network
> > protocol.
>=20
> We do disable page faults, and there can be deadlocks in page fault
> handlers while no page faults are allowed.
>=20
> I'm roughly aware of the locking hierarchy that other filesystems use,
> and that's something we want to avoid because of two reasons: (1) it
> would be an incompatible change, and (2) we want to avoid cluster-wide
> locking operations as much as possible because they are very slow.
>=20
> These kinds of locking conflicts are so rare in practice that the
> theoretical inefficiency of having to retry the operation doesn't
> matter.

Would you be willing to expand on that? I'm wondering if this would
simplify things for gfs2, but you mention locking heirarchy being an
incompatible change - how does that work?

>=20
> > I'm absolutely not in favour to add workarounds for thes kind of lockin=
g
> > problems to the core kernel.  I already feel bad for allowing the
> > small workaround in iomap for btrfs, as just fixing the locking back
> > then would have avoid massive ratholing.
>=20
> Please let me know when those btrfs changes are in a presentable shape ..=
.

I would also be curious to know what btrfs needs and what the approach
is there.

