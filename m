Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7CA10372
	for <lists+cluster-devel@lfdr.de>; Wed,  1 May 2019 02:10:24 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6C6FBC057F4B;
	Wed,  1 May 2019 00:10:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 00AAC1001DCF;
	Wed,  1 May 2019 00:10:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2CE6A3FB11;
	Wed,  1 May 2019 00:10:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x410A7lG001238 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 30 Apr 2019 20:10:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E80DF5D9C6; Wed,  1 May 2019 00:10:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from localhost.localdomain (ovpn-121-218.rdu2.redhat.com
	[10.10.121.218])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 36E106D7E8;
	Wed,  1 May 2019 00:10:01 +0000 (UTC)
To: Bob Peterson <rpeterso@redhat.com>,
	cluster-devel <cluster-devel@redhat.com>
References: <20190430230319.10375-1-rpeterso@redhat.com>
From: Steven Whitehouse <swhiteho@redhat.com>
Message-ID: <4f2ce7cb-85ec-acd8-4b00-32e7ee4bc7fc@redhat.com>
Date: Wed, 1 May 2019 01:10:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190430230319.10375-1-rpeterso@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [GFS2 PATCH v3 00/19] gfs2: misc recovery patch
 collection
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Wed, 01 May 2019 00:10:22 +0000 (UTC)

Hi,

On 01/05/2019 00:03, Bob Peterson wrote:
> Here is version 3 of the patch set I posted on 23 April. It is revised
> based on bugs I found testing with xfstests.
>
> This is a collection of patches I've been using to address the myriad
> of recovery problems I've found. I'm still finding them, so the battle
> is not won yet. I'm not convinced we need all of these but I thought
> I'd send them anyway and get feedback. Previously I sent out a version
> of the patch "gfs2: Force withdraw to replay journals and wait for it
> to finish" that was too big and complex. So I broke it up into four
> patches, starting with "move check_journal_clean to util.c for future
> use". So those four need to be a set. There aren't many other dependencies
> between patches, so the others could probably be taken or rejected
> individually. There are more patches I still need to perfect, but maybe
> a few of the safer ones can be pushed to for-next.

There is quite a lot of good stuff here, but it would be good to split 
it up and make it clearer what is bug fixes, and what are new features,

Steve.


> Bob Peterson (19):
>    gfs2: kthread and remount improvements
>    gfs2: eliminate tr_num_revoke_rm
>    gfs2: log which portion of the journal is replayed
>    gfs2: Warn when a journal replay overwrites a rgrp with buffers
>    gfs2: Introduce concept of a pending withdraw
>    gfs2: log error reform
>    gfs2: Only complain the first time an io error occurs in quota or log
>    gfs2: Stop ail1 wait loop when withdrawn
>    gfs2: Ignore recovery attempts if gfs2 has io error or is withdrawn
>    gfs2: move check_journal_clean to util.c for future use
>    gfs2: Allow some glocks to be used during withdraw
>    gfs2: Don't loop forever in gfs2_freeze if withdrawn
>    gfs2: Make secondary withdrawers wait for first withdrawer
>    gfs2: Don't write log headers after file system withdraw
>    gfs2: Force withdraw to replay journals and wait for it to finish
>    gfs2: simply gfs2_freeze by removing case
>    gfs2: Add verbose option to check_journal_clean
>    gfs2: Check for log write errors before telling dlm to unlock
>    gfs2: Do log_flush in gfs2_ail_empty_gl even if ail list is empty
>
>   fs/gfs2/aops.c       |   4 +-
>   fs/gfs2/file.c       |   2 +-
>   fs/gfs2/glock.c      |  82 +++++++++++++++--
>   fs/gfs2/glock.h      |   1 +
>   fs/gfs2/glops.c      | 100 +++++++++++++++++++--
>   fs/gfs2/glops.h      |   3 +-
>   fs/gfs2/incore.h     |  21 ++++-
>   fs/gfs2/inode.c      |  14 ++-
>   fs/gfs2/lock_dlm.c   |  50 +++++++++++
>   fs/gfs2/log.c        |  55 +++++++-----
>   fs/gfs2/log.h        |   1 +
>   fs/gfs2/lops.c       |  27 +++++-
>   fs/gfs2/meta_io.c    |   6 +-
>   fs/gfs2/ops_fstype.c |  65 ++++----------
>   fs/gfs2/quota.c      |  10 ++-
>   fs/gfs2/recovery.c   |   3 +-
>   fs/gfs2/super.c      |  88 +++++++++++-------
>   fs/gfs2/super.h      |   1 +
>   fs/gfs2/sys.c        |  14 ++-
>   fs/gfs2/trans.c      |   6 +-
>   fs/gfs2/util.c       | 206 ++++++++++++++++++++++++++++++++++++++++---
>   fs/gfs2/util.h       |  15 ++++
>   22 files changed, 617 insertions(+), 157 deletions(-)
>

