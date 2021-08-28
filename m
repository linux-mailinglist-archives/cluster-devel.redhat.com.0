Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3138D3FA754
	for <lists+cluster-devel@lfdr.de>; Sat, 28 Aug 2021 21:31:10 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-Le8qaBEvPY-eNtQHbWt-WQ-1; Sat, 28 Aug 2021 15:31:02 -0400
X-MC-Unique: Le8qaBEvPY-eNtQHbWt-WQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49A951008064;
	Sat, 28 Aug 2021 19:30:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 34B285C1B4;
	Sat, 28 Aug 2021 19:30:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 08DE51819AC9;
	Sat, 28 Aug 2021 19:30:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17SJSSan028181 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 28 Aug 2021 15:28:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E6BF45F270; Sat, 28 Aug 2021 19:28:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E24795F26C
	for <cluster-devel@redhat.com>; Sat, 28 Aug 2021 19:28:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E71C857AA9
	for <cluster-devel@redhat.com>; Sat, 28 Aug 2021 19:28:25 +0000 (UTC)
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk
	[142.44.231.140]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-145-9wuXMQMVNx6wChy6_NV65w-1; Sat, 28 Aug 2021 15:28:20 -0400
X-MC-Unique: 9wuXMQMVNx6wChy6_NV65w-1
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1mK401-00GsRY-Fl; Sat, 28 Aug 2021 19:28:17 +0000
Date: Sat, 28 Aug 2021 19:28:17 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <YSqOUb7yZ7kBoKRY@zeniv-ca.linux.org.uk>
References: <20210827164926.1726765-1-agruenba@redhat.com>
	<20210827164926.1726765-6-agruenba@redhat.com>
	<YSkz025ncjhyRmlB@zeniv-ca.linux.org.uk>
	<CAHk-=wh5p6zpgUUoY+O7e74X9BZyODhnsqvv=xqnTaLRNj3d_Q@mail.gmail.com>
	<YSk7xfcHVc7CxtQO@zeniv-ca.linux.org.uk>
	<CAHk-=wjMyZLH+ta5SohAViSc10iPj-hRnHc-KPDoj1XZCmxdBg@mail.gmail.com>
	<YSk+9cTMYi2+BFW7@zeniv-ca.linux.org.uk>
	<YSldx9uhMYhT/G8X@zeniv-ca.linux.org.uk>
MIME-Version: 1.0
In-Reply-To: <YSldx9uhMYhT/G8X@zeniv-ca.linux.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>, Josef Bacik <josef@toxicpanda.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Will Deacon <will@kernel.org>, ocfs2-devel@oss.oracle.com
Subject: [Cluster-devel] [RFC][arm64] possible infinite loop in btrfs
	search_ioctl()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

	AFAICS, a48b73eca4ce "btrfs: fix potential deadlock in the search ioctl"
has introduced a bug at least on arm64.

Relevant bits: in search_ioctl() we have
        while (1) {
                ret = fault_in_pages_writeable(ubuf + sk_offset,
                                               *buf_size - sk_offset);
                if (ret)
                        break;

                ret = btrfs_search_forward(root, &key, path, sk->min_transid);
                if (ret != 0) {
                        if (ret > 0)
                                ret = 0;
                        goto err;
                }
                ret = copy_to_sk(path, &key, sk, buf_size, ubuf,
                                 &sk_offset, &num_found);
                btrfs_release_path(path);
                if (ret)
                        break;

        }
and in copy_to_sk() -
                sh.objectid = key->objectid;
                sh.offset = key->offset;
                sh.type = key->type;
                sh.len = item_len;
                sh.transid = found_transid;

                /*
                 * Copy search result header. If we fault then loop again so we
                 * can fault in the pages and -EFAULT there if there's a
                 * problem. Otherwise we'll fault and then copy the buffer in
                 * properly this next time through
                 */
                if (copy_to_user_nofault(ubuf + *sk_offset, &sh, sizeof(sh))) {
                        ret = 0;
                        goto out;
                }
with sk_offset left unchanged if the very first copy_to_user_nofault() fails.

Now, consider a situation on arm64 where ubuf points to the beginning of page,
ubuf[0] can be accessed, but ubuf[16] can not (possible with MTE, AFAICS).  We do
fault_in_pages_writeable(), which succeeds.  When we get to copy_to_user_nofault()
we fail as soon as it gets past the first 16 bytes.  And we repeat everything from
scratch, with no progress made, since short copies are treated as "discard and
repeat" here.

Am I misreading what's going on there?

