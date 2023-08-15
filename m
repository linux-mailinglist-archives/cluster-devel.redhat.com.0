Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CD977C96E
	for <lists+cluster-devel@lfdr.de>; Tue, 15 Aug 2023 10:37:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692088640;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WpOpLzK3cd0fTRhQSC8KEyvoIGjzlPyEYFBOLTwjn8A=;
	b=b+LjIChODKz9+CTQpj3vNi0XfJJTwlh/1hWnzs5eBHwJvWD/wtuBBcuo024fRLx9JeNcPQ
	LnPtBa4l9SFYBFs9T7Racg/CyTPVkbnX/B+0GKpdH/X7sa3H71hQRfMMRETNHrn6A/eKDK
	Zm1CO1Zn3ITAVE/8mdMlIzZJHQ3ZLp4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-Y4AD6UcdM1mQry5xEfxSqw-1; Tue, 15 Aug 2023 04:37:13 -0400
X-MC-Unique: Y4AD6UcdM1mQry5xEfxSqw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD730101A528;
	Tue, 15 Aug 2023 08:37:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 66CF1C15BAD;
	Tue, 15 Aug 2023 08:37:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1B122194658D;
	Tue, 15 Aug 2023 08:37:11 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D1CFA1946587 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 15 Aug 2023 08:37:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AD12A1121315; Tue, 15 Aug 2023 08:37:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A53321121314
 for <cluster-devel@redhat.com>; Tue, 15 Aug 2023 08:37:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 857C7185A78F
 for <cluster-devel@redhat.com>; Tue, 15 Aug 2023 08:37:09 +0000 (UTC)
Received: from out-45.mta0.migadu.com (out-45.mta0.migadu.com
 [91.218.175.45]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-465-mOAHWDOgOZi2Vpnr9uECZg-1; Tue, 15 Aug 2023 04:37:07 -0400
X-MC-Unique: mOAHWDOgOZi2Vpnr9uECZg-1
MIME-Version: 1.0
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20230807110936.21819-2-zhengqi.arch@bytedance.com>
Date: Tue, 15 Aug 2023 16:36:31 +0800
Message-Id: <FC3AE898-443D-4ACB-BCB4-0F8F2F48CDD0@linux.dev>
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
 <20230807110936.21819-2-zhengqi.arch@bytedance.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
X-Migadu-Flow: FLOW_OUT
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Cluster-devel] [PATCH v4 01/48] mm: move some shrinker-related
 function declarations to mm/internal.h
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
Cc: kvm@vger.kernel.org, djwong@kernel.org,
 Roman Gushchin <roman.gushchin@linux.dev>, david@fromorbit.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Linux-MM <linux-mm@kvack.org>, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, cel@kernel.org, x86@kernel.org,
 steven.price@arm.com, cluster-devel@redhat.com, simon.horman@corigine.com,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
 "Paul E. McKenney" <paulmck@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-nfs@vger.kernel.org, rcu@vger.kernel.org, linux-bcache@vger.kernel.org,
 dlemoal@kernel.org, yujie.liu@intel.com, Vlastimil Babka <vbabka@suse.cz>,
 linux-raid@vger.kernel.org, Christian Brauner <brauner@kernel.org>,
 tytso@mit.edu, Greg KH <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>,
 netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org, tkhai@ya.ru
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.dev
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable



> On Aug 7, 2023, at 19:08, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
>=20
> The following functions are only used inside the mm subsystem, so it's
> better to move their declarations to the mm/internal.h file.
>=20
> 1. shrinker_debugfs_add()
> 2. shrinker_debugfs_detach()
> 3. shrinker_debugfs_remove()
>=20
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

Reviewed-by: Muchun Song <songmuchun@bytedance.com>

One nit bellow.

[...]

> +
> +/*
> + * shrinker related functions
> + */

This is a multi-comment format. "/* shrinker related functions. */" is
the right one-line format of comment.

> +
> +#ifdef CONFIG_SHRINKER_DEBUG
> +extern int shrinker_debugfs_add(struct shrinker *shrinker);
> +extern struct dentry *shrinker_debugfs_detach(struct shrinker *shrinker,
> +      int *debugfs_id);
> +extern void shrinker_debugfs_remove(struct dentry *debugfs_entry,
> +    int debugfs_id);
> +#else /* CONFIG_SHRINKER_DEBUG */
> +static inline int shrinker_debugfs_add(struct shrinker *shrinker)
> +{
> +=09return 0;
> +}
> +static inline struct dentry *shrinker_debugfs_detach(struct shrinker *sh=
rinker,
> +     int *debugfs_id)
> +{
> +=09*debugfs_id =3D -1;
> +=09return NULL;
> +}
> +static inline void shrinker_debugfs_remove(struct dentry *debugfs_entry,
> +=09int debugfs_id)
> +{
> +}
> +#endif /* CONFIG_SHRINKER_DEBUG */
> +
> #endif /* __MM_INTERNAL_H */
> --=20
> 2.30.2
>=20

