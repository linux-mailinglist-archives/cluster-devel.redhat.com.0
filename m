Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A32566620B
	for <lists+cluster-devel@lfdr.de>; Wed, 11 Jan 2023 18:38:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673458701;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=YGJIgTfN1JjipHMjfss98PcNNaUF4CupCyImB+zTYVA=;
	b=CCOK8CYGm4Gj/XvDVEHLt7zoJl4yVCkYY6uzZ9oMtdIicMgNqfzxH8QXxV04wp4jw7S0C4
	veRfU56FVGLwexN5UUwB3pgAg9QCn6QyfW9WEdaCYoZmFYR7mCThNlllLw9EnvzDU6kuHs
	vME6ZO1DoJxsyhhTp2FMmY2rSoyFydM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-450-bHsUbMLfOjusbR_NX1Dgzw-1; Wed, 11 Jan 2023 12:38:19 -0500
X-MC-Unique: bHsUbMLfOjusbR_NX1Dgzw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4CFED2A59561;
	Wed, 11 Jan 2023 17:38:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6784E4078903;
	Wed, 11 Jan 2023 17:38:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 23F9419465BA;
	Wed, 11 Jan 2023 17:38:17 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 34CB319465A3 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 11 Jan 2023 17:38:16 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2107E4078904; Wed, 11 Jan 2023 17:38:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 198A84078903
 for <cluster-devel@redhat.com>; Wed, 11 Jan 2023 17:38:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ECFB8100F909
 for <cluster-devel@redhat.com>; Wed, 11 Jan 2023 17:38:15 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-263-2dGls9SHPHm_uxEflIUUcQ-1; Wed, 11 Jan 2023 12:38:10 -0500
X-MC-Unique: 2dGls9SHPHm_uxEflIUUcQ-1
Received: by mail-ed1-f54.google.com with SMTP id 18so23385308edw.7;
 Wed, 11 Jan 2023 09:38:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YGJIgTfN1JjipHMjfss98PcNNaUF4CupCyImB+zTYVA=;
 b=H++ftrHpD9uTRdboF1tDV25qEElGayYO+9JDTqS26+kYbtvZLW0Ggh8A49UNBsYZy+
 MA7kqnZ7uTbFeh7KltSljakfVAjkEcbQM+Vd+a90R1hqJpKNy/R13qpa8cVDuB4R+0DD
 wuWmx2Te/Ll2mrhU80tagJKJhBQL8ATvgub2eX5Zyp2y0r+hmE+MymFUMrGVFsfNM8BB
 4ho21jpz10AsYMI/cRwc+feKaxblcP3SV/9w2mi5J0jam1Ltevif2cCIQxf6raYi2oVD
 eNGYty5SCVvpk0az/ix+XiKaZhCbNLxH82aXTPjazzN7U6zusjfUE0oWqFNDpMWa3FU2
 MROA==
X-Gm-Message-State: AFqh2koEyqWriW7+F/30q/c0sVmWLX5hvJqhxwbMJPK8D2U7MBBgaYr5
 F1W3iWXss0tP/NsYJPcIMAYul/UKVgX06JuVBpU3bZoFjtg=
X-Google-Smtp-Source: AMrXdXuvXNzdUgSIja1KA3Rr50AiKdw8p/UnfAsVIfcgKm26m5j3ZjxX5r+71MfY4+1267boeE9h+sVHIFeqbQwGItE=
X-Received: by 2002:a05:6402:5c5:b0:46d:53d7:d1f6 with SMTP id
 n5-20020a05640205c500b0046d53d7d1f6mr7508909edx.211.1673458688125; Wed, 11
 Jan 2023 09:38:08 -0800 (PST)
MIME-Version: 1.0
References: <20230111113018.459199-1-gregkh@linuxfoundation.org>
 <20230111113018.459199-17-gregkh@linuxfoundation.org>
In-Reply-To: <20230111113018.459199-17-gregkh@linuxfoundation.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 11 Jan 2023 18:37:56 +0100
Message-ID: <CAJZ5v0hSxG0VL8RuQ-7rb_6s7X9shT-Bwy4PR6bHVV3Ka1pdxg@mail.gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Cluster-devel] [PATCH v2 16/16] kobject: kset_uevent_ops: make
 uevent() callback take a const *
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org,
 cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 11, 2023 at 12:30 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> The uevent() callback in struct kset_uevent_ops does not modify the
> kobject passed into it, so make the pointer const to enforce this
> restriction.  When doing so, fix up all existing uevent() callbacks to
> have the correct signature to preserve the build.
>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Christine Caulfield <ccaulfie@redhat.com>
> Cc: David Teigland <teigland@redhat.com>
> Cc: Bob Peterson <rpeterso@redhat.com>
> Cc: Andreas Gruenbacher <agruenba@redhat.com>
> Cc: cluster-devel@redhat.com
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Acked-by: Rafael J. Wysocki <rafael@kernel.org>

> ---
>  drivers/base/core.c     | 4 ++--
>  fs/dlm/lockspace.c      | 4 ++--
>  fs/gfs2/sys.c           | 6 +++---
>  include/linux/kobject.h | 2 +-
>  4 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index 72ec54a8a4e1..b0cee0f30d8d 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -2387,9 +2387,9 @@ static const char *dev_uevent_name(const struct kobject *kobj)
>         return NULL;
>  }
>
> -static int dev_uevent(struct kobject *kobj, struct kobj_uevent_env *env)
> +static int dev_uevent(const struct kobject *kobj, struct kobj_uevent_env *env)
>  {
> -       struct device *dev = kobj_to_dev(kobj);
> +       const struct device *dev = kobj_to_dev(kobj);
>         int retval = 0;
>
>         /* add device node properties if present */
> diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
> index d0b4e2181a5f..9b6cfc4c30e3 100644
> --- a/fs/dlm/lockspace.c
> +++ b/fs/dlm/lockspace.c
> @@ -215,9 +215,9 @@ static int do_uevent(struct dlm_ls *ls, int in)
>         return ls->ls_uevent_result;
>  }
>
> -static int dlm_uevent(struct kobject *kobj, struct kobj_uevent_env *env)
> +static int dlm_uevent(const struct kobject *kobj, struct kobj_uevent_env *env)
>  {
> -       struct dlm_ls *ls = container_of(kobj, struct dlm_ls, ls_kobj);
> +       const struct dlm_ls *ls = container_of(kobj, struct dlm_ls, ls_kobj);
>
>         add_uevent_var(env, "LOCKSPACE=%s", ls->ls_name);
>         return 0;
> diff --git a/fs/gfs2/sys.c b/fs/gfs2/sys.c
> index d87ea98cf535..d8dfabb0bc12 100644
> --- a/fs/gfs2/sys.c
> +++ b/fs/gfs2/sys.c
> @@ -767,10 +767,10 @@ void gfs2_sys_fs_del(struct gfs2_sbd *sdp)
>         wait_for_completion(&sdp->sd_kobj_unregister);
>  }
>
> -static int gfs2_uevent(struct kobject *kobj, struct kobj_uevent_env *env)
> +static int gfs2_uevent(const struct kobject *kobj, struct kobj_uevent_env *env)
>  {
> -       struct gfs2_sbd *sdp = container_of(kobj, struct gfs2_sbd, sd_kobj);
> -       struct super_block *s = sdp->sd_vfs;
> +       const struct gfs2_sbd *sdp = container_of(kobj, struct gfs2_sbd, sd_kobj);
> +       const struct super_block *s = sdp->sd_vfs;
>
>         add_uevent_var(env, "LOCKTABLE=%s", sdp->sd_table_name);
>         add_uevent_var(env, "LOCKPROTO=%s", sdp->sd_proto_name);
> diff --git a/include/linux/kobject.h b/include/linux/kobject.h
> index 58a5b75612e3..bdab370a24f4 100644
> --- a/include/linux/kobject.h
> +++ b/include/linux/kobject.h
> @@ -137,7 +137,7 @@ struct kobj_uevent_env {
>  struct kset_uevent_ops {
>         int (* const filter)(const struct kobject *kobj);
>         const char *(* const name)(const struct kobject *kobj);
> -       int (* const uevent)(struct kobject *kobj, struct kobj_uevent_env *env);
> +       int (* const uevent)(const struct kobject *kobj, struct kobj_uevent_env *env);
>  };
>
>  struct kobj_attribute {
> --
> 2.39.0
>

