Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1DF587E39
	for <lists+cluster-devel@lfdr.de>; Tue,  2 Aug 2022 16:37:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659451069;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=cNP5EZ3r/dlLPlMclsuhtYwwk/4kudaU9iW2Y3Cuv+Y=;
	b=QlCA9jK5NRl5i3V07z98sKrsjMNuXZa3CUZsrw3mWdSo5kdOew6iVxPsOqI3oXl4EGOlXu
	xJDNnkCkS5PnkruYcLqmq0MwPds9c9xiD0VZCQhZoqrsY0AIAZXOeR9MDAZFw+C9pi2rcg
	EeBgkcElMhYAg+r4YqH7ntrSIzxk/a8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-424-MJmJpeDqNwK5lZ4rzu3f7w-1; Tue, 02 Aug 2022 10:37:43 -0400
X-MC-Unique: MJmJpeDqNwK5lZ4rzu3f7w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB9C318A6585;
	Tue,  2 Aug 2022 14:37:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 483702026D4C;
	Tue,  2 Aug 2022 14:37:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D078E1946A4E;
	Tue,  2 Aug 2022 14:37:40 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 328291946A4C for <cluster-devel@listman.corp.redhat.com>;
 Tue,  2 Aug 2022 14:37:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 27F26400DEF8; Tue,  2 Aug 2022 14:37:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 23FBE400EAB2
 for <cluster-devel@redhat.com>; Tue,  2 Aug 2022 14:37:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C4601C1F1E6
 for <cluster-devel@redhat.com>; Tue,  2 Aug 2022 14:37:40 +0000 (UTC)
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-28-d0eHpqL7PaG50NWLIrg1qw-1; Tue, 02 Aug 2022 10:37:39 -0400
X-MC-Unique: d0eHpqL7PaG50NWLIrg1qw-1
Received: by mail-pj1-f70.google.com with SMTP id
 k7-20020a17090a62c700b001ef9c16ba10so10272669pjs.1
 for <cluster-devel@redhat.com>; Tue, 02 Aug 2022 07:37:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cNP5EZ3r/dlLPlMclsuhtYwwk/4kudaU9iW2Y3Cuv+Y=;
 b=Neksy00dK2IKiMrWiyjtU8MQab8RqD+EhmvyedJxuNqmt+qc4ZCKYgfphh18ETBEzz
 q0skroSuJUFj3/iibxII4SGb7NyUlg46y3pb0hPe1JSMfQy5R9u0oY0HrRI/gHGQXTGG
 wLFvHH2o38RZTSXs9nb3Iip/RX/jU2nErThiarL+AHCAyzRc9YU+jqkHoB39Nxvdu2FC
 kq6kuOY8fZfMve6/2I6YkpxTsVdLQMiM8QU0CDTCGOveCH49jTqDTADojJ+ioytsuJqJ
 BtISB+a100J4GNUzauTbyXaBWMxk1+U5p67kCspI9VhqKM+Bfh+dbImxAWZ2RMFcumOt
 d8aw==
X-Gm-Message-State: ACgBeo0bCB2TZ00+CZ8t6XcEuBsgtGjorCQ1TSZ4K8Nss9498pT0iSAJ
 xytn/v0/hb9M24q7TKTHoZnwaEQDQa9U+EWwdGoWIAQsG4ZaLI8MtSuNjb4dydwy+CIalnbhXFf
 dcNEuovwLWyA7SszQZDF+xBr8iyoVm1TpxbFsew==
X-Received: by 2002:a17:90b:2248:b0:1f2:5de5:29a7 with SMTP id
 hk8-20020a17090b224800b001f25de529a7mr25940958pjb.197.1659451057528; 
 Tue, 02 Aug 2022 07:37:37 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4XMFVktVsuhLen2f3zCKk/LDdnYXgB6XW3yWHTw5RWd8EQhvEMTrLdRxIL4FJscwH+fEkv5teROvSfkgCpohw=
X-Received: by 2002:a17:90b:2248:b0:1f2:5de5:29a7 with SMTP id
 hk8-20020a17090b224800b001f25de529a7mr25940932pjb.197.1659451057251; Tue, 02
 Aug 2022 07:37:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220727160222.227803-1-rpeterso@redhat.com>
 <20220727160222.227803-2-rpeterso@redhat.com>
In-Reply-To: <20220727160222.227803-2-rpeterso@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 2 Aug 2022 16:37:26 +0200
Message-ID: <CAHc6FU7mn8dyU336ZUhoWtrKMexJS-gr38kf21q9CO0csxhzKA@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: Re: [Cluster-devel] [PATCH 1/3] gfs2: Prevent double iput for
 journal on error
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
Cc: cluster-devel <cluster-devel@redhat.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 27, 2022 at 6:32 PM Bob Peterson <rpeterso@redhat.com> wrote:
> When a gfs2 file system is withdrawn, it requests recovery from another
> cluster node. To do that, it evicts its journal from memory, but it
> keeps the journal entry queued to the journals queue, jindex_list. After
> recovery it tries to grab a new inode for its (recovered) journal. If it
> cannot, it skips further recovery but its evicted journal is still on
> the jindex list, which means unmount will try to iput it a second time
> after it's been evicted. This second iput causes vfs to complain and BUG
> out:
>
> kernel BUG at fs/inode.c:1680!
>
> To prevent this, this patch takes steps to dequeue the journal
> descriptor from the list when it cannot get a replacement inode. So
> unmount won't find it on the list and try to iput it again.
>
> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> ---
>  fs/gfs2/util.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
> index 8241029a2a5d..78cb12d0fba1 100644
> --- a/fs/gfs2/util.c
> +++ b/fs/gfs2/util.c
> @@ -275,6 +275,17 @@ static void signal_our_withdraw(struct gfs2_sbd *sdp)
>         if (IS_ERR(inode)) {
>                 fs_warn(sdp, "Reprocessing of jid %d failed with %ld.\n",
>                         sdp->sd_lockstruct.ls_jid, PTR_ERR(inode));
> +               /*
> +                * We couldn't get a replacement inode for our journal but we
> +                * evicted the old one. So dequeue it from the journals queue,
> +                * jindex_list, so that unmount doesn't do iput on it twice.
> +                */
> +               spin_lock(&sdp->sd_jindex_spin);
> +               list_del(&sdp->sd_jdesc->jd_list);
> +               sdp->sd_journals--;
> +               spin_unlock(&sdp->sd_jindex_spin);
> +               kfree(sdp->sd_jdesc);
> +               sdp->sd_jdesc = NULL;

Wouldn't it make more sense to set sdp->sd_jdesc->jd_inode to NULL
where we call iput() on that inode? An iput(NULL) is a no-op, so we'd
not need to change gfs2_jindex_free() to make that work.

Thanks,
Andreas

>                 goto skip_recovery;
>         }
>         sdp->sd_jdesc->jd_inode = inode;
> --
> 2.36.1
>

