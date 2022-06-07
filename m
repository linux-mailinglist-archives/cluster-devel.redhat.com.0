Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 312DE540208
	for <lists+cluster-devel@lfdr.de>; Tue,  7 Jun 2022 17:03:25 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-xYHqfA70NZ2vQL79fTfmsQ-1; Tue, 07 Jun 2022 11:03:19 -0400
X-MC-Unique: xYHqfA70NZ2vQL79fTfmsQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8B7685A588;
	Tue,  7 Jun 2022 15:03:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BAB1DC27E92;
	Tue,  7 Jun 2022 15:03:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 83E8F1947B88;
	Tue,  7 Jun 2022 15:03:18 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BD41519452D2 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  7 Jun 2022 15:03:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9BFA240D2969; Tue,  7 Jun 2022 15:03:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 97F7140D2962
 for <cluster-devel@redhat.com>; Tue,  7 Jun 2022 15:03:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 75B343C0E200
 for <cluster-devel@redhat.com>; Tue,  7 Jun 2022 15:03:17 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-493-_IXOflvRPQeGfNA6N5Pr4Q-1; Tue, 07 Jun 2022 11:03:16 -0400
X-MC-Unique: _IXOflvRPQeGfNA6N5Pr4Q-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nyajP-00Bj6v-LJ; Tue, 07 Jun 2022 15:02:55 +0000
Date: Tue, 7 Jun 2022 16:02:55 +0100
From: Matthew Wilcox <willy@infradead.org>
To: kernel test robot <lkp@intel.com>
Message-ID: <Yp9on0GvbGbdN+cv@casper.infradead.org>
References: <20220606204050.2625949-15-willy@infradead.org>
 <202206071414.41wGG8fp-lkp@intel.com>
MIME-Version: 1.0
In-Reply-To: <202206071414.41wGG8fp-lkp@intel.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: Re: [Cluster-devel] [PATCH 14/20] hugetlb: Convert to migrate_folio
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
Cc: linux-aio@kvack.org, linux-nfs@vger.kernel.org, cluster-devel@redhat.com,
 kbuild-all@lists.01.org, linux-ntfs-dev@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, linux-mm@kvack.org, linux-mtd@lists.infradead.org,
 ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 07, 2022 at 02:13:26PM +0800, kernel test robot wrote:
>    fs/hugetlbfs/inode.c: In function 'hugetlbfs_migrate_folio':
> >> fs/hugetlbfs/inode.c:990:17: error: implicit declaration of function 'folio_migrate_copy' [-Werror=implicit-function-declaration]
>      990 |                 folio_migrate_copy(dst, src);
>          |                 ^~~~~~~~~~~~~~~~~~
> >> fs/hugetlbfs/inode.c:992:17: error: implicit declaration of function 'folio_migrate_flags'; did you mean 'folio_mapping_flags'? [-Werror=implicit-function-declaration]
>      992 |                 folio_migrate_flags(dst, src);
>          |                 ^~~~~~~~~~~~~~~~~~~
>          |                 folio_mapping_flags
>    cc1: some warnings being treated as errors

Thanks, fixed.

