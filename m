Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E2D4D2C5C8D
	for <lists+cluster-devel@lfdr.de>; Thu, 26 Nov 2020 20:19:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1606418342;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=I+wpMEGxmEukDve1lqYwq5JnH7S6BeW9DNNVWEwC0UY=;
	b=LcQqRD5T21qpCOF90IWkXp0g574wUhXzh84PYDZjBsVSpNPLv4O6y265iuQ4AgwvVWVDO8
	C5QgTQWuNZTeaRVtsFGPb8JoFL/oncH4Az2mIi+FThm+0Z0FzjXwhQcpAxX4lU6UHbB6Ei
	P9ehkJULx98xlEfvWuvGjf4KiKQ7Wu4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-CoN8qfvxNtWNHtnGzlcbrQ-1; Thu, 26 Nov 2020 14:19:00 -0500
X-MC-Unique: CoN8qfvxNtWNHtnGzlcbrQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C9BB1005D5E;
	Thu, 26 Nov 2020 19:18:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 02D7E5D6AC;
	Thu, 26 Nov 2020 19:18:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C6F8F1809CA0;
	Thu, 26 Nov 2020 19:18:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AQJIrIQ009551 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 26 Nov 2020 14:18:53 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E5F552166B29; Thu, 26 Nov 2020 19:18:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E139B2166B27
	for <cluster-devel@redhat.com>; Thu, 26 Nov 2020 19:18:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8F2E8811E76
	for <cluster-devel@redhat.com>; Thu, 26 Nov 2020 19:18:49 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
	[209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-147-qu6Qm5yWN7mwKLvv_yMDag-1; Thu, 26 Nov 2020 14:18:47 -0500
X-MC-Unique: qu6Qm5yWN7mwKLvv_yMDag-1
Received: by mail-wm1-f72.google.com with SMTP id o203so1612437wmo.3
	for <cluster-devel@redhat.com>; Thu, 26 Nov 2020 11:18:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=I+wpMEGxmEukDve1lqYwq5JnH7S6BeW9DNNVWEwC0UY=;
	b=uVrHCzDm3BOOHtWRH4C1Fszu7BNZ8hCgoSBDtWp/E4d6UTdevzwyJcHgtE9oJkUV5K
	yGMgewKodvq5BxWOUD+7LUGHNfE9/R1ZHRWkaUszPHeoX4oJp7yl1F13MAyfr4+817kH
	bnSL13qzjQ9DRBMaFNdAzqS6c1Z+l35tgyuw4LKL/LwJ9l8Ucwr6ZMqZuuI34AXdfVRG
	MRj35L+9YS0NsbTg2DIs92KLSurPw0eLz6QZdMTt4aDracpdKswBRhiCfYpTtjVQZmV2
	LfM3BVQHp0oLm03q6BY1SLC5ppJpTQSzc1bIsmYFuCt+Z7FUw2LUVmIfdpfnXmtCWIk3
	Qchw==
X-Gm-Message-State: AOAM533As27kO++Qcce83x/s+TpPLwhuWV2OYKz3Ve7ARUMB8ohQtbpL
	X2B2Xcxt8K8LS1ArjnUMBv4rvYmNNtFf1GvBZB59irMbVoGd4VwmsT9npebGwa0uNL8DVFBx2x4
	+afRqFucU+1sIdfIiE4Ym2ynOdK0V2GL92hUF/A==
X-Received: by 2002:a5d:618c:: with SMTP id j12mr5606865wru.182.1606418326219; 
	Thu, 26 Nov 2020 11:18:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyO6dwH0AJI8aTShImcImG/OpKW280sYxnmraW8A33E9Sht9i2zYCEVNYiENDSnGYyvsUUP0wab8FbtJvs7ZGI=
X-Received: by 2002:a5d:618c:: with SMTP id j12mr5606850wru.182.1606418326026; 
	Thu, 26 Nov 2020 11:18:46 -0800 (PST)
MIME-Version: 1.0
References: <20201124164240.436553-1-agruenba@redhat.com>
	<90580131-3d14-3620-d397-2b8754bbaa92@redhat.com>
In-Reply-To: <90580131-3d14-3620-d397-2b8754bbaa92@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 26 Nov 2020 20:18:34 +0100
Message-ID: <CAHc6FU4NSdMdLNQC_M=oZxj5yy+fXykVKrH3rX+Tm7tQCnJ2kQ@mail.gmail.com>
To: Steven Whitehouse <swhiteho@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [PATCH] gfs2: Take inode glock exclusively when
 mounted without noatime
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 25, 2020 at 9:49 AM Steven Whitehouse <swhiteho@redhat.com> wrote:
> On 24/11/2020 16:42, Andreas Gruenbacher wrote:
> > Commit 20f829999c38 ("gfs2: Rework read and page fault locking") has lifted the
> > glock lock taking from the low-level ->readpage and ->readahead address space
> > operations to the higher-level ->read_iter file and ->fault vm operations.  The
> > glocks are still taken in LM_ST_SHARED mode only.  On filesystems mounted
> > without the noatime option, ->read_iter needs to update the atime as well
> > though, so we currently run into a failed locking mode assertion in
> > gfs2_dirty_inode.  Fix that by taking the glock in LM_ST_EXCLUSIVE mode on
> > filesystems mounted without the noatime mount option.
> >
> > Faulting in pages doesn't update the atime, so in the ->fault vm operation,
> > taking the glock in LM_ST_SHARED mode is enough.
>
> I don't think this makes any sense to do. It is going to reduce the
> scalibility quite a lot I suspect. Even if you have multiple nodes
> reading a file, the atime updates would not be synchronous with the
> reads, so why insist on an exclusive lock here?

Indeed, it's a bit slow, even though I'm not sure where you're going
with that "not synchronous" argument. I've replaced this with a patch
that upgrades a shared lock to an exclusive lock only when the atime
actually needs to be updated; see "gfs2: Upgrade shared glocks for
atime updates".

(Note that the revised patch isn't easy to test without
instrumentation because usually, the atime update will happen when we
try to read from the page cache, in which case gfs2_update_time will
be called without holding the glock.)

Thanks,
Andreas

