Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 74737672ABD
	for <lists+cluster-devel@lfdr.de>; Wed, 18 Jan 2023 22:42:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674078165;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=25/ogZ1IY1yCzD+p9FJLZ5EqJq4IvrsYWI+uktJqoc8=;
	b=heMn9ZU6EOF4TCQMMMsSqtUTfbP8VGosoqhMtae+oBJaPCAQJaLClXExWYAWRDudThJDRr
	JHpQEP/8jSkpu1hT2NRtY1sT9A5Ao378DGPIvlsLHsI4nDHEc5AFd0HHoTCeZtn5Wv7Edc
	QDtfesG7hfop2XpDhVHJAHAQ5/PSiow=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-7FnawR-pPxy8C11uvjgB1g-1; Wed, 18 Jan 2023 16:42:39 -0500
X-MC-Unique: 7FnawR-pPxy8C11uvjgB1g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6BF0F886462;
	Wed, 18 Jan 2023 21:42:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1B51DC15BAD;
	Wed, 18 Jan 2023 21:42:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AEC671946A6E;
	Wed, 18 Jan 2023 21:42:37 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CB9F91946A45 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 18 Jan 2023 21:42:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 67263492B01; Wed, 18 Jan 2023 21:42:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FA40492B00
 for <cluster-devel@redhat.com>; Wed, 18 Jan 2023 21:42:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4545D101A55E
 for <cluster-devel@redhat.com>; Wed, 18 Jan 2023 21:42:30 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-558-n8JlnMgpOc-CSF6kBiBM8g-1; Wed, 18 Jan 2023 16:42:28 -0500
X-MC-Unique: n8JlnMgpOc-CSF6kBiBM8g-1
Received: by mail-pf1-f178.google.com with SMTP id w2so11921023pfc.11
 for <cluster-devel@redhat.com>; Wed, 18 Jan 2023 13:42:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=25/ogZ1IY1yCzD+p9FJLZ5EqJq4IvrsYWI+uktJqoc8=;
 b=hLFSDTYOjQnKFmMqyLYYsmyX/SPV40UWjc93tMntl0rDAx27tPpXJQc3VF0ErswiS3
 oCfwOL9+xurqPDYpYJRQ8+xm5Nmdt8Qtihl8o7sJmiIYa66UJ6ZNwmvcQkTm362ZyrF5
 +2+8A834AJmsaTzRHOQszdYJWcSSuZHaVcyvp987MHkB63y6bXm+8tsgGkLS0cGxuW7P
 gXx+FO8pQgm01S064B/CBvIWC2IE17I77DToGmQ84UWKYb1ewDsSWci3fUqha4i673cQ
 u7IIGBU+Kxoocq6ugcEqK10nh+h2BDkxY3RjBY7a8LObamMjE+zIi309b1Uws0KprEQp
 Va7Q==
X-Gm-Message-State: AFqh2kplzoewqRR0r0J2vS4w1GbNfF/yOzPB/zVl4nmblhm9B6UcWEDM
 7khCrQEVl0+Ou3IDvwdoXAn+nYclDbrOHX22
X-Google-Smtp-Source: AMrXdXuUhT365uogRqJeciSgZ6jusXovRP6UIOCn0m3CnHYkFzQba4SbhSlaI19LX086ihdE2UUqBA==
X-Received: by 2002:a05:6a00:4088:b0:58d:aadf:5e62 with SMTP id
 bw8-20020a056a00408800b0058daadf5e62mr9302248pfb.18.1674078147224; 
 Wed, 18 Jan 2023 13:42:27 -0800 (PST)
Received: from dread.disaster.area (pa49-186-146-207.pa.vic.optusnet.com.au.
 [49.186.146.207]) by smtp.gmail.com with ESMTPSA id
 m2-20020a62a202000000b005869a33dd3bsm20734472pff.164.2023.01.18.13.42.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 13:42:26 -0800 (PST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1pIGCN-004hTW-Hg; Thu, 19 Jan 2023 08:42:23 +1100
Date: Thu, 19 Jan 2023 08:42:23 +1100
From: Dave Chinner <david@fromorbit.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <20230118214223.GH360264@dread.disaster.area>
References: <20230108194034.1444764-1-agruenba@redhat.com>
 <20230108194034.1444764-9-agruenba@redhat.com>
 <20230108215911.GP1971568@dread.disaster.area>
 <CAHc6FU4z1nC8zdM8NvUyMqU29_J7_oNu1pvBHuOvR+M6gq7F0Q@mail.gmail.com>
 <20230109225453.GQ1971568@dread.disaster.area>
 <CAHpGcM+urV5LYpTZQWTRoK6VWaLx0sxk3mDe_kd3VznMY9woVw@mail.gmail.com>
 <Y8Q4FmhYehpQPZ3Z@magnolia>
MIME-Version: 1.0
In-Reply-To: <Y8Q4FmhYehpQPZ3Z@magnolia>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [Cluster-devel] [RFC v6 08/10] iomap/xfs: Eliminate the
 iomap_valid handler
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
Cc: linux-xfs@vger.kernel.org, cluster-devel@redhat.com,
 Andreas =?iso-8859-1?Q?Gr=FCnbacher?= <andreas.gruenbacher@gmail.com>,
 Matthew Wilcox <willy@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jan 15, 2023 at 09:29:58AM -0800, Darrick J. Wong wrote:
> 2. Do we need to revalidate mappings for directio writes?  I think the
> answer is no (for xfs) because the ->iomap_begin call will allocate
> whatever blocks are needed and truncate/punch/reflink block on the
> iolock while the directio writes are pending, so you'll never end up
> with a stale mapping.  But I don't know if that statement applies
> generally...

The issue is not truncate/punch/reflink for either DIO or buffered
IO - the issue that leads to stale iomaps is async extent state.
i.e. IO completion doing unwritten extent conversion.

For DIO, AIO doesn't hold the IOLOCK at all when completion is run
(like buffered writeback), but non-AIO DIO writes hold the IOLOCK
shared while waiting for completion. This means that we can have DIO
submission and completion still running concurrently, and so stale
iomaps are a definite possibility.

From my notes when I looked at this:

1. the race condition for a DIO write mapping go stale is an
overlapping DIO completion and converting the block from unwritten
to written, and then the dio write incorrectly issuing sub-block
zeroing because the mapping is now stale.

2. DIO read into a hole or unwritten extent zeroes the entire range
in the user buffer in one operation. If this is a large range, this
could race with small DIO writes within that range that have
completed

3. There is a window between dio write completion doing unwritten
extent conversion (by ->end_io) and the page cache being
invalidated, providing a window where buffered read maps can be
stale and incorrect read behaviour exposed to userpace before
the page cache is invalidated.

These all stem from IO having overlapping ranges, which is largely
unsupported but can't be entirely prevented (e.g. backup
applications running in the background). Largely the problems are
confined to sub-block IOs. i.e.  when sub-block DIO writes to the
same block are being performed, we have the possiblity that one
write completes whilst the other is deciding what to zero, unaware
that the range is now MAPPED rather than UNWRITTEN.

We currently avoid issues with sub-block dio writes by using
IOMAP_DIO_OVERWRITE_ONLY with shared locking. This ensures that the
unaligned IO fits entirely within a MAPPED extent so no sub-block
zeroing is required. If allocation or sub-block zeroing is required,
then we force the filesystem to fall back to exclusive IO locking
and wait for all concurrent DIO in flight to complete so that it
can't race with any other DIO write that might cause the map to
become stale while we are doing the zeroing.

This does not avoid potential issues with DIO write vs buffered
read, nor DIO write vs mmap IO. It's not totally clear to me
whether we need ->iomap_valid checks in the buffered read paths
to avoid the completion races with DIO writes, but there are windows
there where cached iomaps could be considered stale....

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

