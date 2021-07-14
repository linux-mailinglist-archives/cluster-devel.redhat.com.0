Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 199783C80B8
	for <lists+cluster-devel@lfdr.de>; Wed, 14 Jul 2021 10:53:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626252838;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ehUzP4RDl2KfS0HbIcG+Yt96eMe02EEFH0UyWlfKMD0=;
	b=A9QaDWy002DnHYZiKZJjmfFceQ5iU/0DW9Vos2/jTQtRJpy49yOghWXkSnRgAbrl7eJTrQ
	+zRB/o4LWD531EERV31rLfYvZw2iWx+09PMzlbeMuYewU5IB24YbSqMX9VxTuKv/v5JMG8
	FDYkdAYVlvNtkmdBUJUwan6/DoNHvcQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-lO1K99FRPZace58ZqOvNNA-1; Wed, 14 Jul 2021 04:53:57 -0400
X-MC-Unique: lO1K99FRPZace58ZqOvNNA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7691B9126B;
	Wed, 14 Jul 2021 08:53:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A427F26DE6;
	Wed, 14 Jul 2021 08:53:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4A8DF4EA29;
	Wed, 14 Jul 2021 08:53:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16E8rkeb030340 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 14 Jul 2021 04:53:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1B748200E667; Wed, 14 Jul 2021 08:53:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 17986200FA69
	for <cluster-devel@redhat.com>; Wed, 14 Jul 2021 08:53:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5036D8011AF
	for <cluster-devel@redhat.com>; Wed, 14 Jul 2021 08:53:42 +0000 (UTC)
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
	[209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-550-hKP8vVEqMVu9-3-1b0T_bA-1; Wed, 14 Jul 2021 04:53:40 -0400
X-MC-Unique: hKP8vVEqMVu9-3-1b0T_bA-1
Received: by mail-qk1-f200.google.com with SMTP id
	bk12-20020a05620a1a0cb02903b899a4309cso732475qkb.14
	for <cluster-devel@redhat.com>; Wed, 14 Jul 2021 01:53:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:user-agent:mime-version
	:content-transfer-encoding;
	bh=ehUzP4RDl2KfS0HbIcG+Yt96eMe02EEFH0UyWlfKMD0=;
	b=X9i2+cLkMhAqs3Dh1RGNaGb9obwd8k2+AlSV901pKrRStFV0e4I0Aw57iNbhzCrMND
	sPAhXg+30eL4KLCLofwNTC+ia/jijWDDxQi7/vm6LQcnCGRQCw2IX/foMXYbZTJHUJuD
	LLpubDjpq2rlfQ1HNWGN3Ckzb+TnxCCJLw4/nhL96Q1E0rQkb0wohxlGRIqq8myuyfZp
	epMGFoJyfGz58bc5BdWNpMHTTkkxs5/AkOHhmLNdLt8W7ZyNJpHLQ1UcwcpVIj5Vom53
	qI8G4tHUUhwwZ64QqOoyXJPzR4U+biI+0eW/MQDsrVMZD/lXinxo3eFsEgPRknlDMpg4
	F0Rg==
X-Gm-Message-State: AOAM531LBGe8cCwnJ5/qCWRqWcIccvLFL2onn+lW+g75wWKEkasuBhWu
	5DeUDBdYHmaBrDR1jVVdHlFMJrEs8lCkGLv3E0uj7pDleEYfm9Jx2zvRwD+aAlboG0VXZnCsRL3
	em7b7WtGdkOKYBCenqPSuZg==
X-Received: by 2002:a37:9381:: with SMTP id v123mr8811331qkd.64.1626252820227; 
	Wed, 14 Jul 2021 01:53:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy12ZvCLkVrGAIzlqe5YeP8zCEe2DXYs0AP/wxLok3JKy3x8wwSeq0skL+zhEeP+vks6oqovA==
X-Received: by 2002:a37:9381:: with SMTP id v123mr8811321qkd.64.1626252819991; 
	Wed, 14 Jul 2021 01:53:39 -0700 (PDT)
Received: from
	0.7.3.c.2.b.0.0.0.3.7.8.9.5.0.2.0.0.0.0.a.d.f.f.0.b.8.0.1.0.0.2.ip6.arpa
	(0.7.3.c.2.b.0.0.0.3.7.8.9.5.0.2.0.0.0.0.a.d.f.f.0.b.8.0.1.0.0.2.ip6.arpa.
	[2001:8b0:ffda:0:2059:8730:b2:c370])
	by smtp.gmail.com with ESMTPSA id
	q199sm731925qka.112.2021.07.14.01.53.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 14 Jul 2021 01:53:39 -0700 (PDT)
Message-ID: <572c25da73c9d4d94945c7c8670c691a0f75be92.camel@redhat.com>
From: Steven Whitehouse <swhiteho@redhat.com>
To: Bob Peterson <rpeterso@redhat.com>, cluster-devel
	<cluster-devel@redhat.com>
Date: Wed, 14 Jul 2021 09:53:26 +0100
In-Reply-To: <be7487f1-ebfd-e7d5-545c-97bb315afd18@redhat.com>
References: <20210713180958.66995-1-rpeterso@redhat.com>
	<20210713180958.66995-9-rpeterso@redhat.com>
	<ac3ca605d90d29e8424abc56ac5f410c0cc5e0b0.camel@redhat.com>
	<be7487f1-ebfd-e7d5-545c-97bb315afd18@redhat.com>
Organization: Red Hat UK Ltd
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [GFS2 PATCH 08/10] gfs2: New log flush watchdog
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

On Tue, 2021-07-13 at 15:03 -0500, Bob Peterson wrote:
> On 7/13/21 1:41 PM, Steven Whitehouse wrote:
> > Hi,
> > 
> > On Tue, 2021-07-13 at 13:09 -0500, Bob Peterson wrote:
> > > This patch adds a new watchdog whose sole purpose is to complain
> > > when
> > > gfs2_log_flush operations are taking too long.
> > > 
> > This one is a bit confusing. It says that it is to check if the log
> > flush is taking too long, but it appears to set a timeout based on
> > the
> > amount of dirty data that will be written back, so it isn't really
> > the
> > log flush, but the writeback and log flush that is being timed I
> > think?
> > 
> > It also looks like the timeout is entirely dependent upon the
> > number of
> > dirty pages too, and not on the log flush size. I wonder about the
> > performance impact of traversing the list of dirty pages too. If
> > that
> > can be avoided it should make the implementation rather more
> > efficient,
> > 
> > Steve.
> 
> Well, perhaps my patch description was misleading. The watchdog is
> meant
> to time how long function gfs2_log_flush() holds the
> sd_log_flush_lock rwsem
> in write mode. 

I think it needs looking at a bit more carefully. That lock is really
an implementation detail, and one that we expect will change in the not
too distant future as the log code improves.

As you say the description is confusing, and the log messages even more
so, since they give a page count that refers to the ordered writes and
not to the log writes at all. 

Also, we have tools already that should be able to diagnose this issue
(slow I/O) such as blktrace, although I know that is more tricky to
catch after the fact. So I think we need to look at this again to see
if there is a better solution.


> That includes writing the ordered writes as well as the
> metadata. The metadata portion is almost always outweighed 100:1 (or
> more)
> by the ordered writes. The length of time it will take to do the
> ordered 
> writes
> should be based on the number of dirty pages. I don't think running
> the
> ordered writes list will impact performance too badly, and that's one
> reason
> I chose to do it before we actually take the sd_log_flush_lock. It
> does, 
> however,
> hold the sd_ordered_lock lock during its count. Still, it's small 
> compared to
> counting the actual pages or something, and modern cpus can run lists
> very
> quickly.
> 
What limits do we have on the ordered write list length? I seem to
remember we had addressed that issue at some point in the past.
Generally though iterating over what might be quite a long list is not
a good plan from a performance perspective,

Steve.

> My initial version didn't count at all; it just used an arbitrary
> number of
> seconds any log flush _ought_ to take. However, Barry pointed out
> that older
> hardware can be slow when driven to extremes and I didn't want false
> positives.
> 
> I also thought about keeping an interactive count whenever pages are
> dirtied, or when inodes are added to the ordered writes list, but
> that 
> seemed
> like overkill. But it is a reasonable alternative.
> 
> The timeout value is also somewhat arbitrary, but I'm open to
> suggestions.
> 
> In my case, faulty hardware caused log flushes to take a very long
> time, 
> which
> caused many transactions and glocks to be blocked a long time and
> eventually
> hit the 120-second kernel watchdog, which gives the impression glocks
> are
> being held a very long time (which they are) for some unknown reason.
> 
> This can manifest on many (often non-faulty) nodes, since glocks can
> be 
> tied up
> indefinitely waiting for a process who has it locked EX but now must
> wait until it can acquire the transaction lock, which is blocked on
> the 
> log flush:
> My goal was to make hardware problems (like faulty HBAs and fibre
> switches)
> NOT seem like cascading gfs2 file system problems or slowdowns.
> 
> These messages will hopefully prompt operations people to investigate
> the
> cause of the slowdown.
> 
> I tested this patch with faulty hardware, and it yielded messages
> like:
> 
> [ 2127.027527] gfs2: fsid=bobsrhel8:test.0: log flush pid 256206 took
> > 
> 20 seconds to write 98 pages.
> [ 2348.979535] gfs2: fsid=bobsrhel8:test.0: log flush pid 256681 took
> > 
> 1 seconds to write 1 pages.
> [ 3643.571505] gfs2: fsid=bobsrhel8:test.0: log flush pid 262385 took
> > 
> 4 seconds to write 16 pages.
> 
> Regards,
> 
> Bob Peterson
> 
> 

