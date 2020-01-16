Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 228F813DCCB
	for <lists+cluster-devel@lfdr.de>; Thu, 16 Jan 2020 15:00:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579183238;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qK2BFeRDzPxAW2ca5PbwJvmvE4hed85NeJVw41Np/aU=;
	b=gq2+B90TaRiHXvJ64LoawnKpFVlu/XXCbAqDJyFZhj8P6nyCkK/kdAluaMg0X8h5ZkK/fa
	kq0guVHhZTsY0qDj/C7d0znAq3NYiEF+rRWtsAVwBzATGgBC7tP3CpghSqZScvGYzVFHcy
	GMDUy3g7aokYsvpS3eOoWOCrtBiMpUg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-dEG6uB4bPCiF2cgHEdITDg-1; Thu, 16 Jan 2020 09:00:36 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD32F8C4042;
	Thu, 16 Jan 2020 14:00:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 632D95C28D;
	Thu, 16 Jan 2020 14:00:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0244A18089CD;
	Thu, 16 Jan 2020 14:00:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00GE0P6G019797 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 16 Jan 2020 09:00:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 305831005E53; Thu, 16 Jan 2020 14:00:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BCDE1005E59
	for <cluster-devel@redhat.com>; Thu, 16 Jan 2020 14:00:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A74C5803ACF
	for <cluster-devel@redhat.com>; Thu, 16 Jan 2020 14:00:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-155-S2lAT1UVMRSr7OEIkNwubQ-1;
	Thu, 16 Jan 2020 09:00:18 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 1341EAD5E;
	Thu, 16 Jan 2020 14:00:04 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id 62CD91E06F1; Thu, 16 Jan 2020 15:00:04 +0100 (CET)
Date: Thu, 16 Jan 2020 15:00:04 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200116140004.GE8446@quack2.suse.cz>
References: <20200114161225.309792-1-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20200114161225.309792-1-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-MC-Unique: S2lAT1UVMRSr7OEIkNwubQ-1
X-MC-Unique: dEG6uB4bPCiF2cgHEdITDg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00GE0P6G019797
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Peter Zijlstra <peterz@infradead.org>,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-mm@kvack.org, Ingo Molnar <mingo@redhat.com>,
	linux-fsdevel@vger.kernel.org, Waiman Long <longman@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>, linux-ext4@vger.kernel.org,
	Will Deacon <will@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [Cluster-devel] RFC: hold i_rwsem until aio completes
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
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hello!

On Tue 14-01-20 17:12:13, Christoph Hellwig wrote:
> Asynchronous read/write operations currently use a rather magic locking
> scheme, were access to file data is normally protected using a rw_semapho=
re,
> but if we are doing aio where the syscall returns to userspace before the
> I/O has completed we also use an atomic_t to track the outstanding aio
> ops.  This scheme has lead to lots of subtle bugs in file systems where
> didn't wait to the count to reach zero, and due to its adhoc nature also
> means we have to serialize direct I/O writes that are smaller than the
> file system block size.
>=20
> All this is solved by releasing i_rwsem only when the I/O has actually
> completed, but doings so is against to mantras of Linux locking primites:
>=20
>  (1) no unlocking by another process than the one that acquired it
>  (2) no return to userspace with locks held

I'd like to note that using i_dio_count has also one advantage you didn't
mention. For AIO case, if you need to hold i_rwsem in exclusive mode,
holding the i_rwsem just for submission part is a significant performance
advantage (shorter lock hold times allow for higher IO parallelism). I
guess this could be mitigated by downgrading the lock to shared mode
once the IO is submitted. But there will be still some degradation visible
for the cases of mixed exclusive and shared acquisitions because shared
holders will be blocking exclusive ones for longer time.

This may be especially painful for filesystems that don't implement DIO
overwrites with i_rwsem in shared mode...


=09=09=09=09=09=09=09=09Honza
--=20
Jan Kara <jack@suse.com>
SUSE Labs, CR


