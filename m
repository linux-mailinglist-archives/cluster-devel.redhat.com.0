Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 4ADD515A22F
	for <lists+cluster-devel@lfdr.de>; Wed, 12 Feb 2020 08:37:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581493063;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5ZK/DDux75vfvBLIXU6/Q3160zbuP/mLc5GfZuxcSN8=;
	b=PyxNfeQeF3HcF/P6e+ESbiopRkO8facOPMuOJjkslYen32U0qlwxFAVKI7ZcsrWJYYSene
	kpGEpL3XTHhyyrFVl5LYYPfyC4rywE5gKDc5dvGW576caZMrlxAurmFqgYiT6/g9nROAVF
	6bRiAvrKK9rCmG8yn4ZbxFZ9ZNYFQYg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-TdrT3YZgOO2yOjRDuuqcCw-1; Wed, 12 Feb 2020 02:37:41 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15F38800D48;
	Wed, 12 Feb 2020 07:37:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 393BC5DA7B;
	Wed, 12 Feb 2020 07:37:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DF8AE18089C8;
	Wed, 12 Feb 2020 07:37:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01C7bRH8006451 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 12 Feb 2020 02:37:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DBA18F496D; Wed, 12 Feb 2020 07:37:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D3702F497B
	for <cluster-devel@redhat.com>; Wed, 12 Feb 2020 07:37:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E22E8012C0
	for <cluster-devel@redhat.com>; Wed, 12 Feb 2020 07:37:25 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-183-7xIMMUAYOXWxV-qqr05iFQ-1;
	Wed, 12 Feb 2020 02:37:21 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
	id BD9B868B05; Wed, 12 Feb 2020 08:37:17 +0100 (CET)
Date: Wed, 12 Feb 2020 08:37:17 +0100
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>
Message-ID: <20200212073717.GB25555@lst.de>
References: <20200114161225.309792-1-hch@lst.de>
	<20200114161225.309792-2-hch@lst.de>
	<20200210152942.2ec4d0b71851feccb7387266@linux-foundation.org>
MIME-Version: 1.0
In-Reply-To: <20200210152942.2ec4d0b71851feccb7387266@linux-foundation.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-MC-Unique: 7xIMMUAYOXWxV-qqr05iFQ-1
X-MC-Unique: TdrT3YZgOO2yOjRDuuqcCw-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01C7bRH8006451
X-loop: cluster-devel@redhat.com
Cc: Naohiro Aota <naohiro.aota@wdc.com>, cluster-devel@redhat.com,
	Peter Zijlstra <peterz@infradead.org>,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-mm@kvack.org, Ingo Molnar <mingo@redhat.com>,
	linux-fsdevel@vger.kernel.org, Waiman Long <longman@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>, linux-ext4@vger.kernel.org,
	Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>
Subject: Re: [Cluster-devel] [PATCH 01/12] mm: fix a comment in sys_swapon
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Mon, Feb 10, 2020 at 03:29:42PM -0800, Andrew Morton wrote:
> On Tue, 14 Jan 2020 17:12:14 +0100 Christoph Hellwig <hch@lst.de> wrote:
>=20
> > claim_swapfile now always takes i_rwsem.
> >=20
> > ...
> >
> > --- a/mm/swapfile.c
> > +++ b/mm/swapfile.c
> > @@ -3157,7 +3157,7 @@ SYSCALL_DEFINE2(swapon, const char __user *, spec=
ialfile, int, swap_flags)
> >  =09mapping =3D swap_file->f_mapping;
> >  =09inode =3D mapping->host;
> > =20
> > -=09/* If S_ISREG(inode->i_mode) will do inode_lock(inode); */
> > +=09/* will take i_rwsem; */
> >  =09error =3D claim_swapfile(p, inode);
> >  =09if (unlikely(error))
> >  =09=09goto bad_swap;
>=20
> http://lkml.kernel.org/r/20200206090132.154869-1-naohiro.aota@wdc.com
> removes this comment altogether.  Please check that this is OK?

Killing it is fine with me.  Just the fact that the comment was wrong
while I did an audit of the area really thew me off.


