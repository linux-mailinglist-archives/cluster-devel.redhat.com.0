Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 7006D5611B
	for <lists+cluster-devel@lfdr.de>; Wed, 26 Jun 2019 06:06:59 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9985A3082B44;
	Wed, 26 Jun 2019 04:06:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B86606012D;
	Wed, 26 Jun 2019 04:06:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0F8BE206D2;
	Wed, 26 Jun 2019 04:06:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5Q42kA5019768 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 26 Jun 2019 00:02:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CDFEE5C205; Wed, 26 Jun 2019 04:02:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C8FF15C1A1
	for <cluster-devel@redhat.com>; Wed, 26 Jun 2019 04:02:44 +0000 (UTC)
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [195.92.253.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 991DD308FE62
	for <cluster-devel@redhat.com>; Wed, 26 Jun 2019 04:02:20 +0000 (UTC)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92 #3 (Red Hat
	Linux)) id 1hfz8F-000086-0E; Wed, 26 Jun 2019 04:02:03 +0000
Date: Wed, 26 Jun 2019 05:02:02 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Message-ID: <20190626040202.GA32272@ZenIV.linux.org.uk>
References: <156151632209.2283456.3592379873620132456.stgit@magnolia>
	<156151633004.2283456.4175543089138173586.stgit@magnolia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <156151633004.2283456.4175543089138173586.stgit@magnolia>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.49]); Wed, 26 Jun 2019 04:02:29 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Wed, 26 Jun 2019 04:02:29 +0000 (UTC) for IP:'195.92.253.2'
	DOMAIN:'zeniv.linux.org.uk' HELO:'ZenIV.linux.org.uk'
	FROM:'viro@ftp.linux.org.uk' RCPT:''
X-RedHat-Spam-Score: -2.298  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_NONE) 195.92.253.2 zeniv.linux.org.uk 195.92.253.2
	zeniv.linux.org.uk <viro@ftp.linux.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: shaggy@kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-efi@vger.kernel.org, Jan Kara <jack@suse.cz>,
	linux-btrfs@vger.kernel.org, yuchao0@huawei.com, clm@fb.com,
	adilger.kernel@dilger.ca, Christoph Hellwig <hch@lst.de>,
	matthew.garrett@nebula.com, linux-nilfs@vger.kernel.org,
	cluster-devel@redhat.com, linux-ext4@vger.kernel.org,
	josef@toxicpanda.com, reiserfs-devel@vger.kernel.org,
	dsterba@suse.com, jaegeuk@kernel.org, tytso@mit.edu,
	ard.biesheuvel@linaro.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-xfs@vger.kernel.org, jk@ozlabs.org, jack@suse.com,
	linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
	ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH 1/5] vfs: create a generic checking and
 prep function for FS_IOC_SETFLAGS
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Wed, 26 Jun 2019 04:06:58 +0000 (UTC)

On Tue, Jun 25, 2019 at 07:32:10PM -0700, Darrick J. Wong wrote:
> From: Darrick J. Wong <darrick.wong@oracle.com>
> 
> Create a generic function to check incoming FS_IOC_SETFLAGS flag values
> and later prepare the inode for updates so that we can standardize the
> implementations that follow ext4's flag values.

Change in efivarfs behaviour deserves a note.  I'm not saying it's wrong,
but behaviour is changed there - no-op FS_IOC_SETFLAGS used to fail
without CAP_LINUX_IMMUTABLE...

