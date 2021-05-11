Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id AEF5237A66F
	for <lists+cluster-devel@lfdr.de>; Tue, 11 May 2021 14:19:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620735596;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=K/62AUSUpA5njWt/mxRQr2h5AShldbfQBaL6AXdA5Jc=;
	b=cS2gwHEBk1KGiZuPegzjqdFx7lYVREeDK+wg83sh1/iScyvWt9UDGVrl6/ii1GS6yAr5sP
	aeI9lOX4c4EKRpaoayCeFDdnvKVfmR77T1+twbhG3lLx5ZgFqkkGvIcG5TjMAIfZyIWmzX
	GsEMl7RnSYvIah5mHZxYhqAUkNqIsOE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-kaMcSksgOves3lC-iQMpdw-1; Tue, 11 May 2021 08:19:55 -0400
X-MC-Unique: kaMcSksgOves3lC-iQMpdw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE02E107ACC7;
	Tue, 11 May 2021 12:19:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D1DB60C04;
	Tue, 11 May 2021 12:19:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6ABAC1806D0E;
	Tue, 11 May 2021 12:19:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14BCJgWq022746 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 11 May 2021 08:19:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9900E5D9F2; Tue, 11 May 2021 12:19:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 287A65D9D7;
	Tue, 11 May 2021 12:19:39 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0DAD34BB40;
	Tue, 11 May 2021 12:19:39 +0000 (UTC)
Date: Tue, 11 May 2021 08:19:38 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: Junxiao Bi <junxiao.bi@oracle.com>
Message-ID: <1750769001.24809997.1620735578939.JavaMail.zimbra@redhat.com>
In-Reply-To: <4d120e2e-5eb4-1bbb-cc63-8c3b7c62dac0@oracle.com>
References: <20210426220552.45413-1-junxiao.bi@oracle.com>
	<20210509162306.9de66b1656f04994f3cb5730@linux-foundation.org>
	<4d120e2e-5eb4-1bbb-cc63-8c3b7c62dac0@oracle.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.112.114, 10.4.195.1]
Thread-Topic: fs/buffer.c: add new api to allow eof writeback
Thread-Index: aQPKcUwGH5yqUlPghB6gr17JLe3JLQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, cluster-devel@redhat.com,
	linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [Ocfs2-devel] [PATCH 1/3] fs/buffer.c: add new
 api to allow eof writeback
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

----- Original Message -----
> On 5/9/21 4:23 PM, Andrew Morton wrote:
> 
> > On Mon, 26 Apr 2021 15:05:50 -0700 Junxiao Bi <junxiao.bi@oracle.com>
> > wrote:
> >
> >> When doing truncate/fallocate for some filesytem like ocfs2, it
> >> will zero some pages that are out of inode size and then later
> >> update the inode size, so it needs this api to writeback eof
> >> pages.
> > Seems reasonable.  But can we please update the
> > __block_write_full_page_eof() comment?  It now uses the wrong function
> > name and doesn't document the new `eof' argument.
> 
> Jan suggested using sb_issue_zeroout to zero eof pages in
> ocfs2_fallocate, that can
> 
> also fix the issue for ocfs2. For gfs2, i though it had the same issue,
> but i didn't get
> 
> a confirm from gfs2 maintainer, if gfs2 is ok, then maybe this new api
> is not necessary?
> 
> Thanks,
> 
> Junxiao.

Hi,

Sorry. I was on holiday/vacation for the past week and a half without
Internet access except for my phone. I'll try to find the time to read
the thread and look into it soon.

Bob Peterson

