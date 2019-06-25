Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D49555A2
	for <lists+cluster-devel@lfdr.de>; Tue, 25 Jun 2019 19:13:19 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2399D3091DD0;
	Tue, 25 Jun 2019 17:12:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF3AE60C43;
	Tue, 25 Jun 2019 17:12:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 24364206D2;
	Tue, 25 Jun 2019 17:12:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5PHCMqp011268 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 25 Jun 2019 13:12:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DFF3319936; Tue, 25 Jun 2019 17:12:22 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D95B419C6F
	for <cluster-devel@redhat.com>; Tue, 25 Jun 2019 17:12:20 +0000 (UTC)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 59BB081120
	for <cluster-devel@redhat.com>; Tue, 25 Jun 2019 17:12:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id BF52AAD8A;
	Tue, 25 Jun 2019 17:12:09 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
	id 45DFDDA8F6; Tue, 25 Jun 2019 19:12:54 +0200 (CEST)
Date: Tue, 25 Jun 2019 19:12:54 +0200
From: David Sterba <dsterba@suse.cz>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Message-ID: <20190625171254.GT8917@twin.jikos.cz>
Mail-Followup-To: dsterba@suse.cz, "Darrick J. Wong" <darrick.wong@oracle.com>,
	matthew.garrett@nebula.com, yuchao0@huawei.com, tytso@mit.edu,
	shaggy@kernel.org, ard.biesheuvel@linaro.org, josef@toxicpanda.com,
	clm@fb.com, adilger.kernel@dilger.ca, jk@ozlabs.org, jack@suse.com,
	dsterba@suse.com, jaegeuk@kernel.org, viro@zeniv.linux.org.uk,
	cluster-devel@redhat.com, jfs-discussion@lists.sourceforge.net,
	linux-efi@vger.kernel.org, Jan Kara <jack@suse.cz>,
	reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
	linux-nilfs@vger.kernel.org, linux-mtd@lists.infradead.org,
	ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
References: <156116136742.1664814.17093419199766834123.stgit@magnolia>
	<156116138140.1664814.9610454726122206157.stgit@magnolia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <156116138140.1664814.9610454726122206157.stgit@magnolia>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.28]); Tue, 25 Jun 2019 17:12:11 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]);
	Tue, 25 Jun 2019 17:12:11 +0000 (UTC) for IP:'195.135.220.15'
	DOMAIN:'mx2.suse.de' HELO:'mx1.suse.de' FROM:'dsterba@suse.cz'
	RCPT:''
X-RedHat-Spam-Score: -2.3  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_PASS) 195.135.220.15 mx2.suse.de 195.135.220.15
	mx2.suse.de <dsterba@suse.cz>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.28
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: shaggy@kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-efi@vger.kernel.org, Jan Kara <jack@suse.cz>,
	linux-btrfs@vger.kernel.org, yuchao0@huawei.com, clm@fb.com,
	adilger.kernel@dilger.ca, matthew.garrett@nebula.com,
	linux-nilfs@vger.kernel.org, cluster-devel@redhat.com,
	linux-ext4@vger.kernel.org, josef@toxicpanda.com,
	reiserfs-devel@vger.kernel.org, viro@zeniv.linux.org.uk,
	dsterba@suse.com, jaegeuk@kernel.org, tytso@mit.edu,
	ard.biesheuvel@linaro.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-xfs@vger.kernel.org, jk@ozlabs.org, jack@suse.com,
	linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
	ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH 1/4] vfs: create a generic checking
 function for FS_IOC_SETFLAGS
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: dsterba@suse.cz
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Tue, 25 Jun 2019 17:13:18 +0000 (UTC)

On Fri, Jun 21, 2019 at 04:56:21PM -0700, Darrick J. Wong wrote:
> From: Darrick J. Wong <darrick.wong@oracle.com>
> 
> Create a generic checking function for the incoming FS_IOC_SETFLAGS flag
> values so that we can standardize the implementations that follow ext4's
> flag values.

I checked a few samples what's the type of the flags, there are unsigned
types while the proposed VFS functions take signed type.

> +int vfs_ioc_setflags_check(struct inode *inode, int oldflags, int flags);

Specifically ext4 uses unsigned type and his was the original API that
got copied so I'd think that it should unsigned everywhere.

>  fs/btrfs/ioctl.c    |   13 +++++--------

For the btrfs bits

Acked-by: David Sterba <dsterba@suse.com>

and besides the signedness, the rest of the changes look good to me.

