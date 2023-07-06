Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BEF74A1C3
	for <lists+cluster-devel@lfdr.de>; Thu,  6 Jul 2023 18:05:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688659511;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=4J+ECJODsJ+Ikh1a1mcZDQQ79aE9IceamX2qMZ26MRU=;
	b=Z+bmu/u5cQhNiMhsHtCjXrKJJXlymbN8u8oXWqLSu5y31fOFYAvc2wCMd7ijC3Q63Qoi8t
	RdjKsKg405t+a+vgSNol4e09WUd0ScfZAk/bIME6jWgoN3p0mCTdqjAzV3fL8wisRotAR5
	Px1aKnZ6d4K+eQkScks43flhNvtXrdw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-261-RS6rcpOhM5u_vn6qHXH8JA-1; Thu, 06 Jul 2023 12:05:10 -0400
X-MC-Unique: RS6rcpOhM5u_vn6qHXH8JA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB9861C0878A;
	Thu,  6 Jul 2023 16:05:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 77020C478DE;
	Thu,  6 Jul 2023 16:05:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3295119465A0;
	Thu,  6 Jul 2023 16:05:07 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1A8A01946589 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  6 Jul 2023 16:05:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DD9C540C6CD0; Thu,  6 Jul 2023 16:05:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D5B7840C6CCD
 for <cluster-devel@redhat.com>; Thu,  6 Jul 2023 16:05:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B4669104458C
 for <cluster-devel@redhat.com>; Thu,  6 Jul 2023 16:05:05 +0000 (UTC)
Received: from out02.mta.xmission.com (out02.mta.xmission.com
 [166.70.13.232]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-474-QEMlHNCROQC0Utp8qV_lGw-1; Thu, 06 Jul 2023 12:03:52 -0400
X-MC-Unique: QEMlHNCROQC0Utp8qV_lGw-1
Received: from in01.mta.xmission.com ([166.70.13.51]:40568)
 by out02.mta.xmission.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1qHQio-00FMgf-7e; Thu, 06 Jul 2023 09:16:42 -0600
Received: from ip68-110-29-46.om.om.cox.net ([68.110.29.46]:55228
 helo=email.froward.int.ebiederm.org.xmission.com)
 by in01.mta.xmission.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1qHQim-00AsXt-Fk; Thu, 06 Jul 2023 09:16:41 -0600
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Jeff Layton <jlayton@kernel.org>
References: <20230705185812.579118-1-jlayton@kernel.org>
 <a4e6cfec345487fc9ac8ab814a817c79a61b123a.camel@kernel.org>
Date: Thu, 06 Jul 2023 10:16:19 -0500
In-Reply-To: <a4e6cfec345487fc9ac8ab814a817c79a61b123a.camel@kernel.org> (Jeff
 Layton's message of "Wed, 05 Jul 2023 17:57:46 -0400")
Message-ID: <87ilaxgjek.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-XM-SPF: eid=1qHQim-00AsXt-Fk; ; ;
 mid=<87ilaxgjek.fsf@email.froward.int.ebiederm.org>; ; ;
 hst=in01.mta.xmission.com; ; ; ip=68.110.29.46; ; ; frm=ebiederm@xmission.com;
 ; ; spf=pass
X-XM-AID: U2FsdGVkX19hfnilZzLMqG1RlF+DuMto1+nqSkCNAbk=
X-SA-Exim-Connect-IP: 68.110.29.46
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa06.xmission.com
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=8.0 tests=ALL_TRUSTED,BAYES_50,
 DCC_CHECK_NEGATIVE,T_SCC_BODY_TEXT_LINE,T_TM2_M_HEADER_IN_MSG,
 T_TooManySym_01,T_TooManySym_02,T_TooManySym_03 shortcircuit=no
 autolearn=disabled version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
 *      [score: 0.5000]
 *  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
 * -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
 *      [sa06 1397; Body=1 Fuz1=1 Fuz2=1]
 *  0.0 T_TooManySym_02 5+ unique symbols in subject
 *  0.0 T_TooManySym_03 6+ unique symbols in subject
 * -0.0 T_SCC_BODY_TEXT_LINE No description available.
 *  0.0 T_TooManySym_01 4+ unique symbols in subject
X-Spam-DCC: XMission; sa06 1397; Body=1 Fuz1=1 Fuz2=1
X-Spam-Combo: ;Jeff Layton <jlayton@kernel.org>
X-Spam-Relay-Country: 
X-Spam-Timing: total 959 ms - load_scoreonly_sql: 0.04 (0.0%),
 signal_user_changed: 12 (1.2%), b_tie_ro: 10 (1.1%), parse: 1.62
 (0.2%), extract_message_metadata: 4.3 (0.4%), get_uri_detail_list:
 1.88 (0.2%), tests_pri_-2000: 2.4 (0.3%), tests_pri_-1000: 10 (1.1%),
 tests_pri_-950: 1.27 (0.1%), tests_pri_-900: 1.56 (0.2%),
 tests_pri_-200: 0.85 (0.1%), tests_pri_-100: 4.3 (0.4%),
 tests_pri_-90: 283 (29.5%), check_bayes: 278 (29.0%), b_tokenize: 27
 (2.9%), b_tok_get_all: 20 (2.1%), b_comp_prob: 4.6 (0.5%),
 b_tok_touch_all: 220 (23.0%), b_finish: 0.94 (0.1%), tests_pri_0: 616
 (64.3%), check_dkim_signature: 0.56 (0.1%), check_dkim_adsp: 2.8
 (0.3%), poll_dns_idle: 0.55 (0.1%), tests_pri_10: 2.2 (0.2%),
 tests_pri_500: 9 (0.9%), rewrite_mail: 0.00 (0.0%)
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in01.mta.xmission.com)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Cluster-devel] [PATCH v2 00/89] fs: new accessors for
 inode->i_ctime
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
Cc: lucho@ionkov.net, rafael@kernel.org, djwong@kernel.org, al@alarsen.net,
 cmllamas@google.com, andrii@kernel.org, hughd@google.com,
 john.johansen@canonical.com, agordeev@linux.ibm.com, hch@lst.de,
 hubcap@omnibond.com, pc@manguebit.com, linux-xfs@vger.kernel.org,
 bvanassche@acm.org, jeffxu@chromium.org, mpe@ellerman.id.au,
 john@keeping.me.uk, yi.zhang@huawei.com, jmorris@namei.org,
 christophe.leroy@csgroup.eu, code@tyhicks.com, stern@rowland.harvard.edu,
 borntraeger@linux.ibm.com, devel@lists.orangefs.org, mirimmad17@gmail.com,
 sprasad@microsoft.com, jaharkes@cs.cmu.edu, linux-um@lists.infradead.org,
 npiggin@gmail.com, viro@zeniv.linux.org.uk, ericvh@kernel.org,
 surenb@google.com, trond.myklebust@hammerspace.com, anton@tuxera.com,
 brauner@kernel.org, wsa+renesas@sang-engineering.com,
 gregkh@linuxfoundation.org, stephen.smalley.work@gmail.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, lsahlber@redhat.com,
 senozhatsky@chromium.org, arve@android.com, chuck.lever@oracle.com,
 svens@linux.ibm.com, jolsa@kernel.org, jack@suse.com, tj@kernel.org,
 akpm@linux-foundation.org, linux-trace-kernel@vger.kernel.org,
 xu.xin16@zte.com.cn, shaggy@kernel.org, dhavale@google.com,
 penguin-kernel@I-love.SAKURA.ne.jp, zohar@linux.ibm.com, linux-mm@kvack.org,
 joel@joelfernandes.org, edumazet@google.com, sdf@google.com, jomajm@gmail.com,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org, paul@paul-moore.com,
 leon@kernel.org, john.fastabend@gmail.com, mcgrof@kernel.org,
 chi.minghao@zte.com.cn, codalist@coda.cs.cmu.edu, selinux@vger.kernel.org,
 zhangpeng362@huawei.com, quic_ugoswami@quicinc.com, yhs@fb.com,
 yzaikin@google.com, linkinjeon@kernel.org, mhiramat@kernel.org,
 ecryptfs@vger.kernel.org, tkjos@android.com, madkar@cs.stonybrook.edu,
 gor@linux.ibm.com, yuzhe@nfschina.com, linuxppc-dev@lists.ozlabs.org,
 reiserfs-devel@vger.kernel.org, miklos@szeredi.hu, huyue2@coolpad.com,
 jaegeuk@kernel.org, gargaditya08@live.com, maco@android.com,
 hirofumi@mail.parknet.co.jp, haoluo@google.com, tony.luck@intel.com,
 tytso@mit.edu, nico@fluxnic.net, linux-ntfs-dev@lists.sourceforge.net,
 muchun.song@linux.dev, roberto.sassu@huawei.com,
 linux-f2fs-devel@lists.sourceforge.net, yang.yang29@zte.com.cn,
 gpiccoli@igalia.com, anna@kernel.org, quic_uaggarwa@quicinc.com,
 bwarrum@linux.ibm.com, mike.kravetz@oracle.com, jingyuwang_vip@163.com,
 linux-efi@vger.kernel.org, error27@gmail.com, martin@omnibond.com,
 trix@redhat.com, ocfs2-devel@lists.linux.dev, ast@kernel.org,
 sebastian.reichel@collabora.com, clm@fb.com, linux-mtd@lists.infradead.org,
 willy@infradead.org, marc.dionne@auristor.com, linux-afs@lists.infradead.org,
 raven@themaw.net, naohiro.aota@wdc.com, daniel@iogearbox.net,
 dennis.dalessandro@cornelisnetworks.com, linux-rdma@vger.kernel.org,
 quic_linyyuan@quicinc.com, coda@cs.cmu.edu, slava@dubeyko.com,
 idryomov@gmail.com, pabeni@redhat.com, adobriyan@gmail.com, serge@hallyn.com,
 chengzhihao1@huawei.com, axboe@kernel.dk, amir73il@gmail.com,
 linuszeng@tencent.com, keescook@chromium.org, arnd@arndb.de,
 autofs@vger.kernel.org, rostedt@goodmis.org, yifeliu@cs.stonybrook.edu,
 dlemoal@kernel.org, eparis@parisplace.org, ceph-devel@vger.kernel.org,
 xiang@kernel.org, yijiangshan@kylinos.cn, dhowells@redhat.com,
 linux-nfs@vger.kernel.org, linux-ext4@vger.kernel.org, kolga@netapp.com,
 song@kernel.org, samba-technical@lists.samba.org, sfrench@samba.org,
 jk@ozlabs.org, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 bpf@vger.kernel.org, ntfs3@lists.linux.dev, linux-erofs@lists.ozlabs.org,
 davem@davemloft.net, jfs-discussion@lists.sourceforge.net,
 princekumarmaurya06@gmail.com, ebiggers@google.com, neilb@suse.de,
 asmadeus@codewreck.org, linux_oss@crudebyte.com, me@bobcopeland.com,
 kpsingh@kernel.org, okanatov@gmail.com,
 almaz.alexandrovich@paragon-software.com, joseph.qi@linux.alibaba.com,
 hayama@lineo.co.jp, adilger.kernel@dilger.ca, mikulas@artax.karlin.mff.cuni.cz,
 shaozhengchao@huawei.com, chenzhongjin@huawei.com, ardb@kernel.org,
 anton.ivanov@cambridgegreys.com, richard@nod.at, mark@fasheh.com,
 shr@devkernel.io, Dai.Ngo@oracle.com, cluster-devel@redhat.com, jgg@ziepe.ca,
 kuba@kernel.org, riel@surriel.com, salah.triki@gmail.com, dushistov@mail.ru,
 linux-cifs@vger.kernel.org, hca@linux.ibm.com, chao@kernel.org,
 apparmor@lists.ubuntu.com, josef@toxicpanda.com, Liam.Howlett@Oracle.com,
 tom@talpey.com, hdegoede@redhat.com, linux-hardening@vger.kernel.org,
 aivazian.tigran@gmail.com, dsterba@suse.com, xiubli@redhat.com,
 konishi.ryusuke@gmail.com, jgross@suse.com, jth@kernel.org,
 rituagar@linux.ibm.com, luisbg@kernel.org, martin.lau@linux.dev,
 v9fs@lists.linux.dev, fmdefrancesco@gmail.com, linux-unionfs@vger.kernel.org,
 lrh2000@pku.edu.cn, linux-security-module@vger.kernel.org,
 ezk@cs.stonybrook.edu, jefflexu@linux.alibaba.com, linux@treblig.org,
 hannes@cmpxchg.org, phillip@squashfs.org.uk, johannes@sipsolutions.net,
 sj1557.seo@samsung.com, dwmw2@infradead.org,
 linux-karma-devel@lists.sourceforge.net, linux-btrfs@vger.kernel.org,
 jlbec@evilplan.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: xmission.com
Content-Type: text/plain

Jeff Layton <jlayton@kernel.org> writes:

> On Wed, 2023-07-05 at 14:58 -0400, Jeff Layton wrote:
>> v2:
>> - prepend patches to add missing ctime updates
>> - add simple_rename_timestamp helper function
>> - rename ctime accessor functions as inode_get_ctime/inode_set_ctime_*
>> - drop individual inode_ctime_set_{sec,nsec} helpers
>> 
>> I've been working on a patchset to change how the inode->i_ctime is
>> accessed in order to give us conditional, high-res timestamps for the
>> ctime and mtime. struct timespec64 has unused bits in it that we can use
>> to implement this. In order to do that however, we need to wrap all
>> accesses of inode->i_ctime to ensure that bits used as flags are
>> appropriately handled.
>> 
>> The patchset starts with reposts of some missing ctime updates that I
>> spotted in the tree. It then adds a new helper function for updating the
>> timestamp after a successful rename, and new ctime accessor
>> infrastructure.
>> 
>> The bulk of the patchset is individual conversions of different
>> subsysteme to use the new infrastructure. Finally, the patchset renames
>> the i_ctime field to __i_ctime to help ensure that I didn't miss
>> anything.
>> 
>> This should apply cleanly to linux-next as of this morning.
>> 
>> Most of this conversion was done via 5 different coccinelle scripts, run
>> in succession, with a large swath of by-hand conversions to clean up the
>> remainder.
>> 
>
> A couple of other things I should note:
>
> If you sent me an Acked-by or Reviewed-by in the previous set, then I
> tried to keep it on the patch here, since the respun patches are mostly
> just renaming stuff from v1. Let me know if I've missed any.
>
> I've also pushed the pile to my tree as this tag:
>
>     https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git/tag/?h=ctime.20230705
>
> In case that's easier to work with.

Are there any preliminary patches showing what you want your introduced
accessors to turn into?  It is hard to judge the sanity of the
introduction of wrappers without seeing what the wrappers are ultimately
going to do.

Eric

