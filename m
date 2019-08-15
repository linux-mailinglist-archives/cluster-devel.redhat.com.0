Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 2989F8EB09
	for <lists+cluster-devel@lfdr.de>; Thu, 15 Aug 2019 14:07:18 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 882DE315C009;
	Thu, 15 Aug 2019 12:07:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ABB205D6A5;
	Thu, 15 Aug 2019 12:07:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 24E8083543;
	Thu, 15 Aug 2019 12:07:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7FC77PO000626 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 15 Aug 2019 08:07:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BBE4384007; Thu, 15 Aug 2019 12:07:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 41FB083C14;
	Thu, 15 Aug 2019 12:07:05 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1596718005A0;
	Thu, 15 Aug 2019 12:07:05 +0000 (UTC)
Date: Thu, 15 Aug 2019 08:07:04 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <1709436723.8673728.1565870824837.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190814204259.120942-4-arnd@arndb.de>
References: <20190814204259.120942-1-arnd@arndb.de>
	<20190814204259.120942-4-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.3.117.77, 10.4.195.5]
Thread-Topic: gfs2: add compat_ioctl support
Thread-Index: 8SO9yFi8yGVJNB4umFOMffc9nMr6lg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, "Darrick J. Wong" <darrick.wong@oracle.com>,
	linux-kernel@vger.kernel.org, NeilBrown <neilb@suse.com>,
	cluster-devel@redhat.com, viro@zeniv.linux.org.uk,
	linux-fsdevel@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v5 03/18] gfs2: add compat_ioctl support
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Thu, 15 Aug 2019 12:07:16 +0000 (UTC)

----- Original Message -----
> Out of the four ioctl commands supported on gfs2, only FITRIM
> works in compat mode.
> 
> Add a proper handler based on the ext4 implementation.
> 
> Fixes: 6ddc5c3ddf25 ("gfs2: getlabel support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  fs/gfs2/file.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)

Hi,

Reviewed-by: Bob Peterson <rpeterso@redhat.com>

Regards,

Bob Peterson

