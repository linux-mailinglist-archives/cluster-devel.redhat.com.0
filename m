Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1708BBDC
	for <lists+cluster-devel@lfdr.de>; Tue, 13 Aug 2019 16:45:45 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7CAB169EE7;
	Tue, 13 Aug 2019 14:45:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 48BA034693;
	Tue, 13 Aug 2019 14:45:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 737AC1800202;
	Tue, 13 Aug 2019 14:45:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7DEjdZK007023 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 13 Aug 2019 10:45:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3152E82E2E; Tue, 13 Aug 2019 14:45:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BFEA82E2C
	for <cluster-devel@redhat.com>; Tue, 13 Aug 2019 14:45:36 +0000 (UTC)
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
	[209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B394A81F0D
	for <cluster-devel@redhat.com>; Tue, 13 Aug 2019 14:45:36 +0000 (UTC)
Received: by mail-ot1-f71.google.com with SMTP id g8so10918139otj.16
	for <cluster-devel@redhat.com>; Tue, 13 Aug 2019 07:45:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OhAkEZQou2Xnctdo6W1gHVnWbimAi+J+iXI/cUmLn7s=;
	b=KfYjP6cKpV4PebSdo3h7dRrseay+hkGfsD2RxnbiNxgT5MpmlQ+PRAYYdy1rt2mstT
	B8+6dOqKZolsMdNVyopglkYMwew1ue7zlY1pYZTJSdkmZXYxL0n5OY1kC0ch9DRwHDGZ
	hRjI7+N2SV58rHaukuCw871M/Ht9UVYy6WKFneo005FoHEHPoZIs0/FyUiTXGFK93Dse
	DisCULYKzJQO00Q2IqrJbXAYzix347TOrJpQN4SZb7EGVGq3KIdsBzlJYEN04+mRHyIW
	ohO9dCPN/dP17k51ZEBgQObq+9At8JjIOTConUNTGLMrLPFhgDNqlBOM2Bynt4HbHNdh
	5j2A==
X-Gm-Message-State: APjAAAXPZoiC0Ri2luBIqjiLkQ8WW3Kly2/aA+pbmao5JzhInH58eN3J
	NEG1pw7xtPlqLhoYBBxgmzUCUTbAYuI/h/7z6c+xh2qXNJ7UDMCuMY2FR4pXqrmb3IzguAOiKTk
	5xSBQbhUmOdL0qIr02DuExkSNEIGK4fXQmqdnGQ==
X-Received: by 2002:aca:3b89:: with SMTP id i131mr1786502oia.178.1565707536033;
	Tue, 13 Aug 2019 07:45:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwEjEbW8+b7D6FdKjJLQTgGrPdnuNXAFEj2kSrIM+ipQm+UQ3rEHI1gHQq/EbY1TbtpmpSgHTysyYrh+grVYTA=
X-Received: by 2002:aca:3b89:: with SMTP id i131mr1786487oia.178.1565707535774;
	Tue, 13 Aug 2019 07:45:35 -0700 (PDT)
MIME-Version: 1.0
References: <1868688025.7054949.1565113904519.JavaMail.zimbra@redhat.com>
	<775740225.7054994.1565113941324.JavaMail.zimbra@redhat.com>
In-Reply-To: <775740225.7054994.1565113941324.JavaMail.zimbra@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 13 Aug 2019 16:45:24 +0200
Message-ID: <CAHc6FU68taCtM5QqkX1ajEfe3FoodZbj3TyoQK0Ubf4_LM7hDQ@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH] gfs2: untangle the logic in
	gfs2_drevalidate
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Tue, 13 Aug 2019 14:45:44 +0000 (UTC)

On Tue, 6 Aug 2019 at 20:01, Bob Peterson <rpeterso@redhat.com> wrote:
>
> Hi,
>
> Before this patch, function gfs2_drevalidate was a horrific tangle of
> unreadable labels, cases and goto statements. This patch tries to
> simplify the logic and make it more readable.
>
> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> ---
>  fs/gfs2/dentry.c | 45 +++++++++++----------------------------------
>  1 file changed, 11 insertions(+), 34 deletions(-)
>
> diff --git a/fs/gfs2/dentry.c b/fs/gfs2/dentry.c
> index a7bb76e9a82b..26d73f94ae45 100644
> --- a/fs/gfs2/dentry.c
> +++ b/fs/gfs2/dentry.c
> @@ -38,7 +38,7 @@ static int gfs2_drevalidate(struct dentry *dentry, unsigned int flags)
>         struct inode *inode;
>         struct gfs2_holder d_gh;
>         struct gfs2_inode *ip = NULL;
> -       int error;
> +       int error, valid = 0;
>         int had_lock = 0;
>
>         if (flags & LOOKUP_RCU)
> @@ -51,53 +51,30 @@ static int gfs2_drevalidate(struct dentry *dentry, unsigned int flags)
>
>         if (inode) {
>                 if (is_bad_inode(inode))
> -                       goto invalid;
> +                       goto out;
>                 ip = GFS2_I(inode);
>         }
>
> -       if (sdp->sd_lockstruct.ls_ops->lm_mount == NULL)
> -               goto valid;
> +       if (sdp->sd_lockstruct.ls_ops->lm_mount == NULL) {
> +               valid = 1;
> +               goto out;
> +       }
>
>         had_lock = (gfs2_glock_is_locked_by_me(dip->i_gl) != NULL);
>         if (!had_lock) {
>                 error = gfs2_glock_nq_init(dip->i_gl, LM_ST_SHARED, 0, &d_gh);
>                 if (error)
> -                       goto fail;
> -       }
> -
> -       error = gfs2_dir_check(d_inode(parent), &dentry->d_name, ip);
> -       switch (error) {
> -       case 0:
> -               if (!inode)
> -                       goto invalid_gunlock;
> -               break;
> -       case -ENOENT:
> -               if (!inode)
> -                       goto valid_gunlock;
> -               goto invalid_gunlock;
> -       default:
> -               goto fail_gunlock;
> +                       goto out;
>         }
>
> -valid_gunlock:
> -       if (!had_lock)
> -               gfs2_glock_dq_uninit(&d_gh);
> -valid:
> -       dput(parent);
> -       return 1;
> +       error = gfs2_dir_check(d_inode(parent), &dentry->d_name, ip);
> +       valid = (!error && inode) || ((error == -ENOENT) && !inode);

valid = inode ? !error : (error == -ENOENT);

> -invalid_gunlock:
>         if (!had_lock)
>                 gfs2_glock_dq_uninit(&d_gh);
> -invalid:
> +out:
>         dput(parent);
> -       return 0;
> -
> -fail_gunlock:
> -       gfs2_glock_dq_uninit(&d_gh);
> -fail:
> -       dput(parent);
> -       return 0;
> +       return valid;
>  }
>
>  static int gfs2_dhash(const struct dentry *dentry, struct qstr *str)

Andreas

