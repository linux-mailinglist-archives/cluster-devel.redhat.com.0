Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0D17125016C
	for <lists+cluster-devel@lfdr.de>; Mon, 24 Aug 2020 17:46:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1598284007;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=V456xHpPkIhv20ICd20JYzOcEoVxtDHABeEkaGkK1/4=;
	b=iu2C/93n7i6c55102dmsHTr/nG5c0sblsuzd17ds1VNS6Alv/Rmwl9oNk7s1SzZWjsg137
	9R8kBn7hPzyYLRKM7BD+jNpydtxh6ge4Q+eWaEOqCDXT/pzpOINpy5Mhqh7vopKEkFom0G
	Ze78cIJFkM3u3eULaJnYD7Vexpf8hus=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-n44xhHfFNgWE1dbgjn52-g-1; Mon, 24 Aug 2020 11:46:45 -0400
X-MC-Unique: n44xhHfFNgWE1dbgjn52-g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2B8F81CBE1;
	Mon, 24 Aug 2020 15:46:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B9D360D34;
	Mon, 24 Aug 2020 15:46:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 51597668F7;
	Mon, 24 Aug 2020 15:46:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07OFgg58028942 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 24 Aug 2020 11:42:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 81E4258; Mon, 24 Aug 2020 15:42:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CB5D5C1C4
	for <cluster-devel@redhat.com>; Mon, 24 Aug 2020 15:42:39 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8219118A0B64;
	Mon, 24 Aug 2020 15:42:39 +0000 (UTC)
Date: Mon, 24 Aug 2020 11:42:39 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <1419243098.13813994.1598283759485.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200824105238.GD1793@kadam>
References: <20200824105238.GD1793@kadam>
MIME-Version: 1.0
X-Originating-IP: [10.3.112.245, 10.4.195.7]
Thread-Topic: fs/gfs2/super.c:1443 gfs2_evict_inode() error: potentially
	dereferencing uninitialized 'metamapping'.
Thread-Index: oHewePsxmBpGRfTlmFhvCX3ZjJj9wQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, kbuild@lists.01.org, kbuild-all@lists.01.org,
	lkp@intel.com
Subject: Re: [Cluster-devel] [gfs2:for-next.bob6m 6/11] fs/gfs2/super.c:1443
 gfs2_evict_inode() error: potentially dereferencing uninitialized
 'metamapping'.
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

----- Original Message -----
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git
> for-next.bob6m
> head:   fd5ce905071cc34294900a21a773d9f8c72f5119
> commit: 4b98604ca5531f8d662e07d4a10d5fe98c9d4eae [6/11] gfs2: Create
> transaction for inodes with i_nlink != 0
> config: i386-randconfig-m021-20200820 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> New smatch warnings:
> fs/gfs2/super.c:1443 gfs2_evict_inode() error: potentially dereferencing
> uninitialized 'metamapping'.

Hi,

Thanks. This is now fixed in the for-next.bob6n branch.

Regards,

Bob Peterson

