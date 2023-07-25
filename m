Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 587F2760FC5
	for <lists+cluster-devel@lfdr.de>; Tue, 25 Jul 2023 11:52:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690278759;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9gwHNxFvek6/oa4n/kTUzhTdq77YBPnC2CEQT31jjp4=;
	b=AZl2kzkFbL8evf0eOQkrik0KH0zhW5SBlfFXuTMROatYKDpAUTCg8mKyPYaJBjtIBbn1bb
	apSSBvpdV7cenhLgBQ8jPhM/EuZzMRNwZOaMrlffWMeIb6LPEW32pbIi3qrOYh0/c2rW0y
	Lb1pmHaEc6d/r21hZQeAD0wEvKwlRcA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-116-WaYj6ApvN_mtXHZ8NX9sgQ-1; Tue, 25 Jul 2023 05:52:35 -0400
X-MC-Unique: WaYj6ApvN_mtXHZ8NX9sgQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D6E7A830DB1;
	Tue, 25 Jul 2023 09:52:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DF2381121333;
	Tue, 25 Jul 2023 09:52:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D60FF193F504;
	Tue, 25 Jul 2023 09:52:31 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 460EC1946A54 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 25 Jul 2023 09:03:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 17087F66A0; Tue, 25 Jul 2023 09:03:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E798F7833
 for <cluster-devel@redhat.com>; Tue, 25 Jul 2023 09:03:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 32B0E3C11A01
 for <cluster-devel@redhat.com>; Tue, 25 Jul 2023 09:03:07 +0000 (UTC)
Received: from out-2.mta1.migadu.com (out-2.mta1.migadu.com [95.215.58.2])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-73--lxWCh_6NpGbx_IqGB_xIg-1; Tue,
 25 Jul 2023 05:03:04 -0400
X-MC-Unique: -lxWCh_6NpGbx_IqGB_xIg-1
Message-ID: <3648ca69-d65e-8431-135a-a5738586bc25@linux.dev>
Date: Tue, 25 Jul 2023 17:02:47 +0800
MIME-Version: 1.0
To: Qi Zheng <zhengqi.arch@bytedance.com>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-4-zhengqi.arch@bytedance.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20230724094354.90817-4-zhengqi.arch@bytedance.com>
X-Migadu-Flow: FLOW_OUT
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mailman-Approved-At: Tue, 25 Jul 2023 09:52:30 +0000
Subject: Re: [Cluster-devel] [PATCH v2 03/47] mm: shrinker: add
 infrastructure for dynamically allocating shrinker
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
Cc: kvm@vger.kernel.org, djwong@kernel.org, roman.gushchin@linux.dev,
 david@fromorbit.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org, cel@kernel.org,
 x86@kernel.org, steven.price@arm.com, cluster-devel@redhat.com,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org, paulmck@kernel.org,
 linux-arm-msm@vger.kernel.org, brauner@kernel.org, rcu@vger.kernel.org,
 linux-bcache@vger.kernel.org, yujie.liu@intel.com, vbabka@suse.cz,
 linux-raid@vger.kernel.org, linux-nfs@vger.kernel.org, tytso@mit.edu,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 senozhatsky@chromium.org, gregkh@linuxfoundation.org,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org, tkhai@ya.ru
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.dev
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable



On 2023/7/24 17:43, Qi Zheng wrote:
> Currently, the shrinker instances can be divided into the following three
> types:
>
> a) global shrinker instance statically defined in the kernel, such as
>     workingset_shadow_shrinker.
>
> b) global shrinker instance statically defined in the kernel modules, suc=
h
>     as mmu_shrinker in x86.
>
> c) shrinker instance embedded in other structures.
>
> For case a, the memory of shrinker instance is never freed. For case b,
> the memory of shrinker instance will be freed after synchronize_rcu() whe=
n
> the module is unloaded. For case c, the memory of shrinker instance will
> be freed along with the structure it is embedded in.
>
> In preparation for implementing lockless slab shrink, we need to
> dynamically allocate those shrinker instances in case c, then the memory
> can be dynamically freed alone by calling kfree_rcu().
>
> So this commit adds the following new APIs for dynamically allocating
> shrinker, and add a private_data field to struct shrinker to record and
> get the original embedded structure.
>
> 1. shrinker_alloc()
>
> Used to allocate shrinker instance itself and related memory, it will
> return a pointer to the shrinker instance on success and NULL on failure.
>
> 2. shrinker_free_non_registered()
>
> Used to destroy the non-registered shrinker instance.

At least I don't like this name. I know you want to tell others
this function only should be called when shrinker has not been
registed but allocated. Maybe shrinker_free() is more simple.
And and a comment to tell the users when to use it.

>
> 3. shrinker_register()
>
> Used to register the shrinker instance, which is same as the current
> register_shrinker_prepared().
>
> 4. shrinker_unregister()
>
> Used to unregister and free the shrinker instance.
>
> In order to simplify shrinker-related APIs and make shrinker more
> independent of other kernel mechanisms, subsequent submissions will use
> the above API to convert all shrinkers (including case a and b) to
> dynamically allocated, and then remove all existing APIs.
>
> This will also have another advantage mentioned by Dave Chinner:
>
> ```
> The other advantage of this is that it will break all the existing
> out of tree code and third party modules using the old API and will
> no longer work with a kernel using lockless slab shrinkers. They
> need to break (both at the source and binary levels) to stop bad
> things from happening due to using uncoverted shrinkers in the new
> setup.
> ```
>
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> ---
>   include/linux/shrinker.h |   6 +++
>   mm/shrinker.c            | 113 +++++++++++++++++++++++++++++++++++++++
>   2 files changed, 119 insertions(+)
>
> diff --git a/include/linux/shrinker.h b/include/linux/shrinker.h
> index 961cb84e51f5..296f5e163861 100644
> --- a/include/linux/shrinker.h
> +++ b/include/linux/shrinker.h
> @@ -70,6 +70,8 @@ struct shrinker {
>   =09int seeks;=09/* seeks to recreate an obj */
>   =09unsigned flags;
>  =20
> +=09void *private_data;
> +
>   =09/* These are for internal use */
>   =09struct list_head list;
>   #ifdef CONFIG_MEMCG
> @@ -98,6 +100,10 @@ struct shrinker {
>  =20
>   unsigned long shrink_slab(gfp_t gfp_mask, int nid, struct mem_cgroup *m=
emcg,
>   =09=09=09  int priority);
> +struct shrinker *shrinker_alloc(unsigned int flags, const char *fmt, ...=
);
> +void shrinker_free_non_registered(struct shrinker *shrinker);
> +void shrinker_register(struct shrinker *shrinker);
> +void shrinker_unregister(struct shrinker *shrinker);
>  =20
>   extern int __printf(2, 3) prealloc_shrinker(struct shrinker *shrinker,
>   =09=09=09=09=09    const char *fmt, ...);
> diff --git a/mm/shrinker.c b/mm/shrinker.c
> index 0a32ef42f2a7..d820e4cc5806 100644
> --- a/mm/shrinker.c
> +++ b/mm/shrinker.c
> @@ -548,6 +548,119 @@ unsigned long shrink_slab(gfp_t gfp_mask, int nid, =
struct mem_cgroup *memcg,
>   =09return freed;
>   }
>  =20
> +struct shrinker *shrinker_alloc(unsigned int flags, const char *fmt, ...=
)
> +{
> +=09struct shrinker *shrinker;
> +=09unsigned int size;
> +=09va_list __maybe_unused ap;
> +=09int err;
> +
> +=09shrinker =3D kzalloc(sizeof(struct shrinker), GFP_KERNEL);
> +=09if (!shrinker)
> +=09=09return NULL;
> +
> +#ifdef CONFIG_SHRINKER_DEBUG
> +=09va_start(ap, fmt);
> +=09shrinker->name =3D kvasprintf_const(GFP_KERNEL, fmt, ap);
> +=09va_end(ap);
> +=09if (!shrinker->name)
> +=09=09goto err_name;
> +#endif

So why not introduce another helper to handle this and declare it
as a void function when !CONFIG_SHRINKER_DEBUG? Something like the
following:

#ifdef CONFIG_SHRINKER_DEBUG
static int shrinker_debugfs_name_alloc(struct shrinker *shrinker, const=20
char *fmt,
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 va_list vargs)

{
 =C2=A0=C2=A0=C2=A0 shrinker->name =3D kvasprintf_const(GFP_KERNEL, fmt, va=
rgs);
 =C2=A0=C2=A0=C2=A0 return shrinker->name ? 0 : -ENOMEM;
}
#else
static int shrinker_debugfs_name_alloc(struct shrinker *shrinker, const=20
char *fmt,
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 va_list vargs)
{
 =C2=A0=C2=A0=C2=A0 return 0;
}
#endif

> +=09shrinker->flags =3D flags;
> +
> +=09if (flags & SHRINKER_MEMCG_AWARE) {
> +=09=09err =3D prealloc_memcg_shrinker(shrinker);
> +=09=09if (err =3D=3D -ENOSYS)
> +=09=09=09shrinker->flags &=3D ~SHRINKER_MEMCG_AWARE;
> +=09=09else if (err =3D=3D 0)
> +=09=09=09goto done;
> +=09=09else
> +=09=09=09goto err_flags;
> +=09}
> +
> +=09/*
> +=09 * The nr_deferred is available on per memcg level for memcg aware
> +=09 * shrinkers, so only allocate nr_deferred in the following cases:
> +=09 *  - non memcg aware shrinkers
> +=09 *  - !CONFIG_MEMCG
> +=09 *  - memcg is disabled by kernel command line
> +=09 */
> +=09size =3D sizeof(*shrinker->nr_deferred);
> +=09if (flags & SHRINKER_NUMA_AWARE)
> +=09=09size *=3D nr_node_ids;
> +
> +=09shrinker->nr_deferred =3D kzalloc(size, GFP_KERNEL);
> +=09if (!shrinker->nr_deferred)
> +=09=09goto err_flags;
> +
> +done:
> +=09return shrinker;
> +
> +err_flags:
> +#ifdef CONFIG_SHRINKER_DEBUG
> +=09kfree_const(shrinker->name);
> +=09shrinker->name =3D NULL;

This could be shrinker_debugfs_name_free()

> +err_name:
> +#endif
> +=09kfree(shrinker);
> +=09return NULL;
> +}
> +EXPORT_SYMBOL(shrinker_alloc);
> +
> +void shrinker_free_non_registered(struct shrinker *shrinker)
> +{
> +#ifdef CONFIG_SHRINKER_DEBUG
> +=09kfree_const(shrinker->name);
> +=09shrinker->name =3D NULL;

This could be shrinker_debugfs_name_free()

> +#endif
> +=09if (shrinker->flags & SHRINKER_MEMCG_AWARE) {
> +=09=09down_write(&shrinker_rwsem);
> +=09=09unregister_memcg_shrinker(shrinker);
> +=09=09up_write(&shrinker_rwsem);
> +=09}
> +
> +=09kfree(shrinker->nr_deferred);
> +=09shrinker->nr_deferred =3D NULL;
> +
> +=09kfree(shrinker);
> +}
> +EXPORT_SYMBOL(shrinker_free_non_registered);
> +
> +void shrinker_register(struct shrinker *shrinker)
> +{
> +=09down_write(&shrinker_rwsem);
> +=09list_add_tail(&shrinker->list, &shrinker_list);
> +=09shrinker->flags |=3D SHRINKER_REGISTERED;
> +=09shrinker_debugfs_add(shrinker);
> +=09up_write(&shrinker_rwsem);
> +}
> +EXPORT_SYMBOL(shrinker_register);
> +
> +void shrinker_unregister(struct shrinker *shrinker)

You have made all shrinkers to be dynamically allocated, so
we should prevent users from allocating shrinkers statically and
use this function to unregister it. It is better to add a
flag like SHRINKER_ALLOCATED which is set in shrinker_alloc(),
and check whether it is set in shrinker_unregister(), if not
maybe a warning should be added to tell the users what happened.

> +{
> +=09struct dentry *debugfs_entry;
> +=09int debugfs_id;
> +
> +=09if (!shrinker || !(shrinker->flags & SHRINKER_REGISTERED))
> +=09=09return;
> +
> +=09down_write(&shrinker_rwsem);
> +=09list_del(&shrinker->list);
> +=09shrinker->flags &=3D ~SHRINKER_REGISTERED;
> +=09if (shrinker->flags & SHRINKER_MEMCG_AWARE)
> +=09=09unregister_memcg_shrinker(shrinker);
> +=09debugfs_entry =3D shrinker_debugfs_detach(shrinker, &debugfs_id);

In the internal of this function, you also could use
shrinker_debugfs_name_free().

Thanks.

> +=09up_write(&shrinker_rwsem);
> +
> +=09shrinker_debugfs_remove(debugfs_entry, debugfs_id);
> +
> +=09kfree(shrinker->nr_deferred);
> +=09shrinker->nr_deferred =3D NULL;
> +
> +=09kfree(shrinker);
> +}
> +EXPORT_SYMBOL(shrinker_unregister);
> +
>   /*
>    * Add a shrinker callback to be called from the vm.
>    */

