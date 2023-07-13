Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D261375251D
	for <lists+cluster-devel@lfdr.de>; Thu, 13 Jul 2023 16:29:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689258592;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hdjh3A+jQxi6jRfACa7G/pNetKuqFLq+oKHocbsTnQ8=;
	b=SM2P/BNOAGO0plVywXYbov6wHjdFCZ/+nXKF5nc1BjJZR6HK8dW+6p5SR0EwdRU7Kb6oQS
	pO1Hx6n1ksEI+/XAKs1UlFps6nVpzOUIyL7v1NGAjBDrp/+sZ6jCkn3jnIomf7m+DfplfO
	ZcSNTDX6WdyIODqhZOR+FlhJOmrLJrg=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-nnwZgz8BPnWp_GCetdUtQw-1; Thu, 13 Jul 2023 10:29:51 -0400
X-MC-Unique: nnwZgz8BPnWp_GCetdUtQw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E37A22803CA6;
	Thu, 13 Jul 2023 14:28:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D4CCD4CD0D8;
	Thu, 13 Jul 2023 14:28:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 991DA19465B3;
	Thu, 13 Jul 2023 14:27:59 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EEA571946589 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 13 Jul 2023 14:27:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CB70AC54FBA; Thu, 13 Jul 2023 14:27:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C4883C52D9C
 for <cluster-devel@redhat.com>; Thu, 13 Jul 2023 14:27:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CDA1538157AA
 for <cluster-devel@redhat.com>; Thu, 13 Jul 2023 14:26:15 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-216-8mEA2mLANxC6bijbYEcVKw-1; Thu, 13 Jul 2023 10:26:08 -0400
X-MC-Unique: 8mEA2mLANxC6bijbYEcVKw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3578B61276;
 Thu, 13 Jul 2023 14:25:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B6E6C433C7;
 Thu, 13 Jul 2023 14:25:54 +0000 (UTC)
From: Christian Brauner <brauner@kernel.org>
To: Andreas Gruenbacher <agruenba@redhat.com>, Jeff Layton <jlayton@kernel.org>
Date: Thu, 13 Jul 2023 16:25:50 +0200
Message-Id: <20230713-beispiel-bezeichnen-cf537927cefd@brauner>
In-Reply-To: <20230713135249.153796-1-jlayton@kernel.org>
References: <20230713135249.153796-1-jlayton@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1115; i=brauner@kernel.org;
 h=from:subject:message-id; bh=ceLGsUdUEdvARZ34SamfY0iHE6Sz+y/w35l/b94Ztx8=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMaRs4Mw+Ei5erdYSLhCbuvKoiYZWkESapb7alPumIS/0KzT1
 pzztKGVhEONikBVTZHFoNwmXW85TsdkoUwNmDisTyBAGLk4BmEjMN0aGu7Oe+r6/avoobZ9m47WcLU
 V7ws/NSDoYIPf3e925aSd1/Bn+2SbPk/3VXFGX3PD8q+URbfGKRWdCNj1eer197vyfZwQmsAMA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [Cluster-devel] [PATCH] gfs2: fix timestamp handling on quota
 inodes
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
Cc: linux-fsdevel@vger.kernel.org, cluster-devel@redhat.com,
 Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 13 Jul 2023 09:52:48 -0400, Jeff Layton wrote:
> While these aren't generally visible from userland, it's best to be
> consistent with timestamp handling. When adjusting the quota, update the
> mtime and ctime like we would with a write operation on any other inode,
> and avoid updating the atime which should only be done for reads.
>=20
>=20

Applied to the vfs.ctime branch of the vfs/vfs.git tree.
Patches in the vfs.ctime branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs.ctime

[1/1] gfs2: fix timestamp handling on quota inodes
      https://git.kernel.org/vfs/vfs/c/ea462c3f7f48

